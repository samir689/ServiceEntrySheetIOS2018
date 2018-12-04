//
// YmSesIosViewDetailViewController.swift
// SESDemo
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/12/18
//

import Foundation
import SAPCommon
import SAPFiori
import SAPFoundation
import SAPOData
import SAPOfflineOData

class YmSesIosViewDetailViewController: FUIFormTableViewController, SAPFioriLoadingIndicator {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var ymsesapprovalsrvEntities: YMSESAPPROVALSRVEntities<OfflineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntities
    }

    private var validity = [String: Bool]()
    private var _entity: YmSesIosView?
    var allowsEditableCells = false
    var entity: YmSesIosView {
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

    private let logger = Logger.shared(named: "YmSesIosViewMasterViewControllerLogger")
    var loadingIndicator: FUILoadingIndicatorView?
    var entityUpdater: EntityUpdaterDelegate?
    var tableUpdater: EntitySetUpdaterDelegate?
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var preventNavigationLoop = false
    var entitySetName: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender _: Any?) {
        if segue.identifier == "updateEntity" {
            // Show the Detail view with the current entity, where the properties scan be edited and updated
            self.logger.info("Showing a view to update the selected entity.")
            let dest = segue.destination as! UINavigationController
            let detailViewController = dest.viewControllers[0] as! YmSesIosViewDetailViewController
            detailViewController.title = NSLocalizedString("keyUpdateEntityTitle", value: "Update Entity", comment: "XTIT: Title of update selected entity screen.")
            detailViewController.entity = self.entity
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: detailViewController, action: #selector(detailViewController.updateEntity))
            detailViewController.navigationItem.rightBarButtonItem = doneButton
            let cancelButton = UIBarButtonItem(title: NSLocalizedString("keyCancelButtonToGoPreviousScreen", value: "Cancel", comment: "XBUT: Title of Cancel button."), style: .plain, target: detailViewController, action: #selector(detailViewController.cancel))
            detailViewController.navigationItem.leftBarButtonItem = cancelButton
            detailViewController.allowsEditableCells = true
            detailViewController.entityUpdater = self
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return self.cellForSesTxz01(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.sesTxz01)
        case 1:
            return self.cellForLblni(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.lblni)
        case 2:
            return self.cellForSbnamag(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.sbnamag)
        case 3:
            return self.cellForErnam(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.ernam)
        case 4:
            return self.cellForLwert(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.lwert)
        case 5:
            return self.cellForLbldt(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.lbldt)
        case 6:
            return self.cellForBsart(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.bsart)
        case 7:
            return self.cellForLifnr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.lifnr)
        case 8:
            return self.cellForEbeln(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.ebeln)
        case 9:
            return self.cellForEbelp(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.ebelp)
        case 10:
            return self.cellForPoTxzo1(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.poTxzo1)
        case 11:
            return self.cellForNetpr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.netpr)
        case 12:
            return self.cellForWiID(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.wiID)
        case 13:
            return self.cellForEindt(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.eindt)
        case 14:
            return self.cellForNetCurr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.netCurr)
        case 15:
            return self.cellForPoCurr(tableView: tableView, indexPath: indexPath, currentEntity: self.entity, property: YmSesIosView.poCurr)
        case 16:
            let cell = CellCreationHelper.cellForDefault(tableView: tableView, indexPath: indexPath, editingIsAllowed: false)
            cell.keyName = "ViewheadToItems"
            cell.value = " "
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            return UITableViewCell()
        }
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return 17
    }

    override func tableView(_: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row < 16 {
            return true
        }
        return false
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.preventNavigationLoop {
            return
        }
        switch indexPath.row {
        case 16:
            self.showFioriLoadingIndicator()
            let destinationStoryBoard = UIStoryboard(name: "YmSesIosItems", bundle: nil)
            var masterViewController = destinationStoryBoard.instantiateViewController(withIdentifier: "YmSesIosItemsMaster")
            func loadProperty(_ completionHandler: @escaping ([YmSesIosItems]?, Error?) -> Void) {
                self.ymsesapprovalsrvEntities.loadProperty(YmSesIosView.viewheadToItems, into: self.entity) { error in
                    self.hideFioriLoadingIndicator()
                    if let error = error {
                        completionHandler(nil, error)
                        return
                    }
                    completionHandler(self.entity.viewheadToItems, nil)
                }
            }
            (masterViewController as! YmSesIosItemsMasterViewController).loadEntitiesBlock = loadProperty
            masterViewController.navigationItem.title = "ViewheadToItems"
            (masterViewController as! YmSesIosItemsMasterViewController).preventNavigationLoop = true
            self.navigationController?.pushViewController(masterViewController, animated: true)
        default:
            return
        }
    }

    // MARK: - OData property specific cell creators

    private func cellForSesTxz01(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.sesTxz01 {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.sesTxz01 = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.sesTxz01.isOptional || newValue != "" {
                    currentEntity.sesTxz01 = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLblni(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.lblni {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.lblni = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.lblni.isOptional || newValue != "" {
                    currentEntity.lblni = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForSbnamag(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.sbnamag {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.sbnamag = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.sbnamag.isOptional || newValue != "" {
                    currentEntity.sbnamag = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForErnam(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.ernam {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.ernam = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.ernam.isOptional || newValue != "" {
                    currentEntity.ernam = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLwert(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.lwert {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.lwert = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.lwert = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLbldt(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.lbldt {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.lbldt = nil
                isNewValueValid = true
            } else {
                if let validValue = LocalDateTime.parse(newValue) { // This is just a simple solution to handle UTC only
                    currentEntity.lbldt = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForBsart(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.bsart {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.bsart = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.bsart.isOptional || newValue != "" {
                    currentEntity.bsart = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForLifnr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.lifnr {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.lifnr = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.lifnr.isOptional || newValue != "" {
                    currentEntity.lifnr = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEbeln(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.ebeln {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.ebeln = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.ebeln.isOptional || newValue != "" {
                    currentEntity.ebeln = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEbelp(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.ebelp {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.ebelp = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.ebelp.isOptional || newValue != "" {
                    currentEntity.ebelp = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPoTxzo1(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.poTxzo1 {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.poTxzo1 = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.poTxzo1.isOptional || newValue != "" {
                    currentEntity.poTxzo1 = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForNetpr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.netpr {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.netpr = nil
                isNewValueValid = true
            } else {
                if let validValue = BigDecimal.parse(newValue) {
                    currentEntity.netpr = validValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForWiID(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.wiID {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.wiID = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.wiID.isOptional || newValue != "" {
                    currentEntity.wiID = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForEindt(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.eindt {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
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

    private func cellForNetCurr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.netCurr {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.netCurr = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.netCurr.isOptional || newValue != "" {
                    currentEntity.netCurr = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    private func cellForPoCurr(tableView: UITableView, indexPath: IndexPath, currentEntity: YmSesIosView, property: Property) -> UITableViewCell {
        var value = ""
        if let propertyValue = currentEntity.poCurr {
            value = "\(propertyValue)"
        }
        return CellCreationHelper.cellForProperty(tableView: tableView, indexPath: indexPath, entity: self.entity, property: property, value: value, editingIsAllowed: self.allowsEditableCells, changeHandler: { (newValue: String) -> Bool in
            var isNewValueValid = false
            // The property is optional, so nil value can be accepted
            if newValue.isEmpty {
                currentEntity.poCurr = nil
                isNewValueValid = true
            } else {
                if YmSesIosView.poCurr.isOptional || newValue != "" {
                    currentEntity.poCurr = newValue
                    isNewValueValid = true
                }
            }
            self.validity[property.name] = isNewValueValid
            self.barButtonShouldBeEnabled()
            return isNewValueValid
        })
    }

    // MARK: - OData functionalities

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
                    self.tableUpdater?.entitySetHasChanged()
                }
            })
        }
    }

    func createEntityWithDefaultValues() -> YmSesIosView {
        let newEntity = YmSesIosView()

        // Key properties without default value should be invalid by default for Create scenario
        if newEntity.lblni == nil || newEntity.lblni!.isEmpty {
            self.validity["Lblni"] = false
        }
        self.barButtonShouldBeEnabled()
        return newEntity
    }

    @objc func updateEntity(_: AnyObject) {
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
            OperationQueue.main.addOperation({
                self.dismiss(animated: true) {
                    FUIToastMessage.show(message: NSLocalizedString("keyUpdateEntityFinishedTitle", value: "Updated", comment: "XTIT: Title of alert message about successful entity update."))
                    self.entityUpdater?.entityHasChanged(self.entity)
                }
            })
        }
    }

    // MARK: - other logic, helper

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
}

extension YmSesIosViewDetailViewController: EntityUpdaterDelegate {
    func entityHasChanged(_ entityValue: EntityValue?) {
        if let entity = entityValue {
            let currentEntity = entity as! YmSesIosView
            self.entity = currentEntity
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
}
