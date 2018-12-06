//
//  DetailTableViewController.swift
//  SESTest08
//
//  Created by Tamas Szuhanszky on 2018. 02. 09..
//  Copyright © 2018. SAP. All rights reserved.
//

// MARK: Custom Documentation
// Class for the Document details screen

import SAPOfflineOData
import UIKit
import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon

class DetailTableViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var ymsesapprovalsrvEntities: YMSESAPPROVALSRVEntities<OnlineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntitiesOnline
    }
    // MARK: Offline provider and delegate
    private var ymsesapprovalsrvEntitiesOffline:  YMSESAPPROVALSRVEntities<OfflineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntities
    }
    private var isStoreOpened = false
    
    @IBOutlet weak var approveButton: UIButton!
    
    private var validity = [String: Bool]()
    private var _entity: YmSesIosApprove?
    var entity: YmSesIosApprove {
        get {
            if self._entity == nil {
                self._entity = self.createEntityWithDefaultValues()
            }
            return self._entity!
        }
        set {
            self._entity = newValue
        }
    }

    private let logger = Logger.shared(named: "YMSESIOSAPPROVESetMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var tableUpdater: EntitySetUpdaterDelegate?
    var entityUpdater: EntityUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    
    @IBAction func approveEvent(_ sender: AnyObject) {
        
        let approvePopUp : UIAlertController = showInputDialog()
        self.present(approvePopUp, animated: true, completion: nil)
        
    }
    
  
    
    func showInputDialog() -> UIAlertController {
        //Creating UIAlertController and
        //Setting title and message for the alert dialog
        let alertController = UIAlertController(title: "Maintain document", message: "Select an option", preferredStyle: .alert)
        
        //the confirm action taking the inputs
        let approveAction = UIAlertAction(title: "Approve", style: .default) { (_) in
            self._entity?.appFlag = "A"
            self.handleDialogAnswer()
        }
        let deleteAction = UIAlertAction(title: "Delete", style: .default) { (_) in
            self._entity?.appFlag = "D"
            self.handleDialogAnswer()
        }
        let blockAction = UIAlertAction(title: "Block", style: .default) { (_) in
            self._entity?.appFlag = "B"
            self.handleDialogAnswer()
        }
        let unblockAction = UIAlertAction(title: "Unblock", style: .default) { (_) in
            self._entity?.appFlag = "U"
            self.handleDialogAnswer()
        }
        
        //the cancel action doing nothing
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
    
        //adding the action to dialogbox
        alertController.addAction(approveAction)
        alertController.addAction(deleteAction)
        alertController.addAction(blockAction)
        alertController.addAction(unblockAction)
        alertController.addAction(cancelAction)
        
        //finally presenting the dialog box
//        self.present(alertController, animated: true, completion: nil)
        return alertController
    }
    
    func handleDialogAnswer() {
        
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        
        // MARK: Offline update
        
        ymsesapprovalsrvEntitiesOffline.open { error in
            guard error == nil else {
                return;
            }
            
            self.isStoreOpened = true
            
            self.ymsesapprovalsrvEntitiesOffline.download { error in
                guard error == nil else {
                    
                    self.ymsesapprovalsrvEntitiesOffline.updateEntity(self.entity) { error in  //pushing updated flag into the DB
                        self.hideFioriLoadingIndicator()
                        if let error = error {
                            self.logger.error("Update entry failed. Error: \(error)", error: error)
                            let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                            alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                            OperationQueue.main.addOperation({
                                // Present the alertController
                                self.present(alertController, animated: true)
                            })
                            return
                        }
                        self.logger.info("Update entry finished successfully.")
                        self.entityUpdater?.entityHasChanged(self._entity)
                        self.closeOfflineStore()
                        
                        //bcust
                        switch self._entity?.appFlag {
                        case "A"?:
                            return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Approved", comment: "XTIT: Title of alert message about successful entity update."))
                        case "B"?:
                            return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Blocked", comment: "XTIT: Title of alert message about successful entity update."))
                        case "U"?:
                            return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Unblocked", comment: "XTIT: Title of alert message about successful entity update."))
                        case "D"?:
                            return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Deleted", comment: "XTIT: Title of alert message about successful entity update."))
                        default:
                            return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Something went wrong", comment: "XTIT: Title of alert message about successful entity update."))
                        }
                        
                       
                    }
                  
                    
                    return
                }
                // MARK: Online
                
                self.ymsesapprovalsrvEntities.updateEntity(self.entity) { error in  //pushing updated flag into the DB
                    self.hideFioriLoadingIndicator()
                    if let error = error {
                        self.logger.error("Update entry failed. Error: \(error)", error: error)
                        let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                        OperationQueue.main.addOperation({
                            // Present the alertController
                            self.present(alertController, animated: true)
                        })
                        return
                    }
                    self.logger.info("Update entry finished successfully.")
                    self.entityUpdater?.entityHasChanged(self._entity)
                    
                    //bcust
                    switch self._entity?.appFlag {
                    case "A"?:
                        return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Approved", comment: "XTIT: Title of alert message about successful entity update."))
                    case "B"?:
                        return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Blocked", comment: "XTIT: Title of alert message about successful entity update."))
                    case "U"?:
                        return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Unblocked", comment: "XTIT: Title of alert message about successful entity update."))
                    case "D"?:
                        return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Deleted", comment: "XTIT: Title of alert message about successful entity update."))
                    default:
                        return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Something went wrong", comment: "XTIT: Title of alert message about successful entity update."))
                    }
                }
            }
        }
        
       
        
        
// MARK: Online update
//        self.ymsesapprovalsrvEntities.updateEntity(self.entity) { error in  //pushing updated flag into the DB
//        self.hideFioriLoadingIndicator()
//        if let error = error {
//            self.logger.error("Update entry failed. Error: \(error)", error: error)
//                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
//                OperationQueue.main.addOperation({
//                    // Present the alertController
//                    self.present(alertController, animated: true)
//                })
//                return
//            }
//            self.logger.info("Update entry finished successfully.")
////            FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert       message about successful         entity update."))
//
//            //self.tableUpdater?.updateTable() //querying for the current state of data
//            //self.tableUpdater?.entitySetHasChanged()
//            self.entityUpdater?.entityHasChanged(self._entity)
//
//            //bcust
//            switch self._entity?.appFlag {
//            case "A"?:
//                return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Approved", comment: "XTIT: Title of alert message about successful entity update."))
//            case "B"?:
//                return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Blocked", comment: "XTIT: Title of alert message about successful entity update."))
//            case "U"?:
//                return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Unblocked", comment: "XTIT: Title of alert message about successful entity update."))
//            case "D"?:
//                return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Deleted", comment: "XTIT: Title of alert message about successful entity update."))
//            default:
//                return FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Something went wrong", comment: "XTIT: Title of alert message about successful entity update."))
//            }
//        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForLblni(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.lblni)
        case 1:
            return self.cellForSesTxz01(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.sesTxz01)
        case 2:
            return self.cellForSbnamag(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.sbnamag)
        case 3:
            return self.cellForErnam(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.ernam)
        case 4:
            return self.cellForLwert(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.lwert)
        case 5:
            return self.cellForLbldt(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.lbldt)
        case 6:
            return self.cellForBsart(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.bsart)
        case 7:
            return self.cellForLifnr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.lifnr)
        case 8:
            return self.cellForEbeln(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.ebeln)
        case 9:
            return self.cellForEbelp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.ebelp)
        case 10:
            return self.cellForPoTxzo1(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.poTxzo1)
        case 11:
            return self.cellForNetpr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.netpr)
        case 12:
            return self.cellForWiID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.wiID)
//        case 13:
//            return self.cellForAppFlag(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.appFlag)
        case 13:
            return self.cellForEindt(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.eindt)
        case 14:
            return self.cellForNetCurr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.netCurr)
        case 15:
            return self.cellForPoCurr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.poCurr)
        //case 16:
            //return self.cellForPoCurr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosApprove.poCurr)
           //return self.cellForItems(tableView: tableView, indexPath: indexPath, currentEntity: self.entity , property: YmSesIosApprove.lblni )
            
        default:
            return CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath)
        }
    }
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 15
    }
    
    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }
    
    // MARK: OData property specific cell creators
    private func cellForLblni(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
    //private func cellForLblni(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITextFieldFormCell {
        var value = ""
        value = "\(currentEntity.lblni ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.lblni.isOptional || newValue != "" {
                currentEntity.lblni = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForSesTxz01(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.sesTxz01 ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.sesTxz01.isOptional || newValue != "" {
                currentEntity.sesTxz01 = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    //bcust
    private func cellForItems(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        let value = "items>>"
        //value = "\(currentEntity.sesTxz01 ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            let isNewValueValid = false
        
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
  
    
    private func cellForSbnamag(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.sbnamag ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.sbnamag.isOptional || newValue != "" {
                currentEntity.sbnamag = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForErnam(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.ernam ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.ernam.isOptional || newValue != "" {
                currentEntity.ernam = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForLwert(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.lwert != nil ? "\(currentEntity.lwert!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = BigDecimal.parse(newValue) {
                currentEntity.lwert = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForLbldt(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.lbldt != nil ? "\(currentEntity.lbldt!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                currentEntity.lbldt = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForBsart(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.bsart ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.bsart.isOptional || newValue != "" {
                currentEntity.bsart = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForLifnr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.lifnr ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.lifnr.isOptional || newValue != "" {
                currentEntity.lifnr = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForEbeln(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.ebeln ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.ebeln.isOptional || newValue != "" {
                currentEntity.ebeln = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForEbelp(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.ebelp ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.ebelp.isOptional || newValue != "" {
                currentEntity.ebelp = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForPoTxzo1(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.poTxzo1 ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.poTxzo1.isOptional || newValue != "" {
                currentEntity.poTxzo1 = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForNetpr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = currentEntity.netpr != nil ? "\(currentEntity.netpr!)" : ""
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if let validValue = BigDecimal.parse(newValue) {
                currentEntity.netpr = validValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForWiID(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.wiID ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.wiID.isOptional || newValue != "" {
                currentEntity.wiID = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForAppFlag(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.appFlag ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.appFlag.isOptional || newValue != "" {
                currentEntity.appFlag = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForEindt(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.eindt {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.eindt = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.eindt = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForNetCurr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.netCurr ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.netCurr.isOptional || newValue != "" {
                currentEntity.netCurr = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    private func cellForPoCurr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosApprove, property: Property) -> UITableViewCell {
        var value = ""
        value = "\(currentEntity.poCurr ?? "")"
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            if YmSesIosApprove.poCurr.isOptional || newValue != "" {
                currentEntity.poCurr = newValue
                isNewValueValid = true
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }
    
    // MARK: OData functionalities
    @IBAction func updateEntity(_: AnyObject) {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Updating entity in backend.")
        self.ymsesapprovalsrvEntities.updateEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Update entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityUpdateTitle", value: "Update entry failed", comment: "XTIT: Title of alert message about entity update failure."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Update entry finished successfully.")
            FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
            //self.tableUpdater?.updateTable()
            self.tableUpdater?.entitySetHasChanged()
        }
    }
    
    @objc func createEntity() {
        self.showFioriLoadingIndicator()
        self.view.endEditing(true)
        self.logger.info("Creating entity in backend.")
        self.ymsesapprovalsrvEntities.createEntity(self.entity) { error in
            self.hideFioriLoadingIndicator()
            if let error = error {
                self.logger.error("Create entry failed. Error: \(error)", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorEntityCreationTitle", value: "Create entry failed", comment: "XTIT: Title of alert message about entity creation error."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                return
            }
            self.logger.info("Create entry finished successfully.")
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyEntityCreationBody", value: "Created", comment: "XMSG: Title of alert message about successful entity creation."))
                    //self.tableUpdater?.updateTable()
                    self.tableUpdater?.entitySetHasChanged()
                }
            })
        }
    }
    
    func createEntityWithDefaultValues() -> YmSesIosApprove {
        let newEntity = YmSesIosApprove()
        // Fill the mandatory properties with default values
        newEntity.lblni = CellCreationHelper.defaultValueFor(YmSesIosApprove.lblni)
        newEntity.sesTxz01 = CellCreationHelper.defaultValueFor(YmSesIosApprove.sesTxz01)
        newEntity.sbnamag = CellCreationHelper.defaultValueFor(YmSesIosApprove.sbnamag)
        newEntity.ernam = CellCreationHelper.defaultValueFor(YmSesIosApprove.ernam)
        newEntity.lwert = CellCreationHelper.defaultValueFor(YmSesIosApprove.lwert)
        newEntity.lbldt = CellCreationHelper.defaultValueFor(YmSesIosApprove.lbldt)
        newEntity.bsart = CellCreationHelper.defaultValueFor(YmSesIosApprove.bsart)
        newEntity.lifnr = CellCreationHelper.defaultValueFor(YmSesIosApprove.lifnr)
        newEntity.ebeln = CellCreationHelper.defaultValueFor(YmSesIosApprove.ebeln)
        newEntity.ebelp = CellCreationHelper.defaultValueFor(YmSesIosApprove.ebelp)
        newEntity.poTxzo1 = CellCreationHelper.defaultValueFor(YmSesIosApprove.poTxzo1)
        newEntity.netpr = CellCreationHelper.defaultValueFor(YmSesIosApprove.netpr)
        newEntity.wiID = CellCreationHelper.defaultValueFor(YmSesIosApprove.wiID)
        newEntity.appFlag = CellCreationHelper.defaultValueFor(YmSesIosApprove.appFlag)
        newEntity.netCurr = CellCreationHelper.defaultValueFor(YmSesIosApprove.netCurr)
        newEntity.poCurr = CellCreationHelper.defaultValueFor(YmSesIosApprove.poCurr)
        
        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.lblni == nil || newEntity.lblni!.isEmpty {
            self.validity["Lblni"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }
    
    // MARK: other logic, helper
    @objc func cancel() {
        OperationQueue.main.addOperation({
            self.dismiss(animated: true)
        })
    }
    
    // Check if all text fields are valid
    private func barButtonShouldBeEnabled() {
        let anyFieldInvalid = self.validity.values.first { field in
            return field == false
        }
        self.navigationItem.rightBarButtonItem?.isEnabled = anyFieldInvalid == nil
    }
    
    //bcust
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItems" {
            // Show the selected Entity on the Detail view
            self.logger.info("Showing details of the chosen element.")
            let selectedEntity = self._entity
            let itemsViewController = segue.destination as! MasterItemsTableViewController
            itemsViewController.SeS = selectedEntity
        }
    }
    
    func closeOfflineStore() {
        if isStoreOpened {
            do {
                try ymsesapprovalsrvEntitiesOffline.close()
                isStoreOpened = false
            } catch {
                logger.error("Offline Store closing failed")
            }
        }
        logger.info("Offline Store closed")
    }


}
