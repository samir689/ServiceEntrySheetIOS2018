//
//  MasterTableViewController.swift
//  SESTest08
//
//  Created by Tamas Szuhanszky on 2018. 02. 09..
//  Copyright © 2018. SAP. All rights reserved.
//

// MARK: Custom Documentation
// Class for the Main Screen

import UIKit
import Foundation
import SAPFoundation
import SAPOData
import SAPFiori
import SAPCommon
import SAPOfflineOData

class MasterTableViewController: FUIFormTableViewController, SAPFioriLoadingIndicator, EntitySetUpdaterDelegate {
    func entitySetHasChanged() {
        self.showFioriLoadingIndicator()
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                self.hideFioriLoadingIndicator()
            }
        })
    }
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var ymsesapprovalsrvEntities: YMSESAPPROVALSRVEntities<OnlineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntities
    }
    // MARK: Offline provider and delegate
    private var ymsesapprovalsrvEntitiesOffline:  YMSESAPPROVALSRVEntities<OfflineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntitiesOffline
    }
    private var isStoreOpened = false
   
    private var entities: [YmSesIosApprove] = [YmSesIosApprove]()
    private let logger = Logger.shared(named: "YmSesIosApproveMasterViewConterollerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        // Add refreshcontrol UI
        //self.refreshControl?.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        //self.tableView.addSubview(self.refreshControl!)
        // Cell height settings
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 98
        //self.updateTable()
        self.entitySetHasChanged()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SesHeaderCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view data source
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.entities.count
    }
    
    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ymsesiosapprove = self.entities[indexPath.row]


// DATE FORMAT
        let startTimeString = "\(ymsesiosapprove.lbldt!)"

// First convert the original formatted date/time to a string:
        let deFormatter = DateFormatter()
        deFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let startTime = deFormatter.date(from: startTimeString)

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let timeString = formatter.string(from: startTime!)
        print(timeString) // 2015-06-25 19:10:00
// Note that `NSDateFormatter` defaults to the local time zone.
// DATE FORMAT END
        
        //var dateString = ""
        //let cell = CellCreationHelper.objectCellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "Lblni", value: "\(ymsesiosapprove.lblni!)")
        let cellIdentifier = "SesHeaderCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MasterTableViewCell else {
            fatalError("Fatal Error: Cell creation")
        }
// Date
        //cell.lbl_lblni.text = "\(ymsesiosapprove.lblni!)"
        cell.lbl_netcurr.text = "\(ymsesiosapprove.netCurr!)"
        cell.lbl_lwert.text = "\(ymsesiosapprove.lwert!)"
        cell.lbl_shorttext.text = "\(ymsesiosapprove.sesTxz01!)"
// Date handling
        if ymsesiosapprove.lbldt == nil {
            cell.lbl_lbldt.text = "Not set"
        } else {
            //dateString = formatter.string(from: ymsesiosapprove.lbldt as! Date)
            cell.lbl_lbldt.text = timeString
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }
        let currentEntity = self.entities[indexPath.row]
        self.ymsesapprovalsrvEntities.deleteEntity(currentEntity) { error in
            if let error = error {
                self.logger.error("Delete entry failed.", error: error)
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorDeletingEntryTitle", value: "Delete entry failed", comment: "XTIT: Title of deleting entry error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
            } else {
                self.entities.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: Data accessing
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
        
//        let query = DataQuery().selectAll().top(20)
//        //query = query.expand(YmSesIosApprove.headToItems)
//        self.ymsesapprovalsrvEntities.fetchYMSESIOSAPPROVESet(matching: query) { yMSESIOSAPPROVESet, error in
//            guard let yMSESIOSAPPROVESet = yMSESIOSAPPROVESet else {
//                completionHandler(error!)
//                return
//            }
//            self.entities = yMSESIOSAPPROVESet
//            completionHandler(nil)
//        }
        
        
        
        // MARK: Offline request implementation
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.

        ymsesapprovalsrvEntitiesOffline.open { error in
            guard error == nil else {
                return;
            }

            self.isStoreOpened = true

            self.ymsesapprovalsrvEntitiesOffline.download { error in
                guard error == nil else {
                    let queryOff = DataQuery().selectAll().top(20)
                    self.ymsesapprovalsrvEntitiesOffline.fetchYMSESIOSAPPROVESet(matching: queryOff) { products, error in
                        guard let products = products else {
                            completionHandler(error!)
                            self.closeOfflineStore()
                            return
                        }
                        self.entities = products
                        completionHandler(nil)
                        self.closeOfflineStore()
                    }
                    return
                }

                let queryOn = DataQuery().selectAll().top(20)
                //query = query.expand(YmSesIosApprove.headToItems)
                self.ymsesapprovalsrvEntities.fetchYMSESIOSAPPROVESet(matching: queryOn) { yMSESIOSAPPROVESet, error in
                    guard let yMSESIOSAPPROVESet = yMSESIOSAPPROVESet else {
                        completionHandler(error!)
                        return
                    }
                    self.entities = yMSESIOSAPPROVESet
                    completionHandler(nil)
                }
            }
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

    
    // MARK: Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            // Show the selected Entity on the Detail view
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                return
            }
            self.logger.info("Showing details of the chosen element.")
            let selectedEntity = self.entities[indexPath.row]
            let detailViewController = segue.destination as! DetailTableViewController
            detailViewController.entity = selectedEntity
            detailViewController.tableUpdater = self
        }
    }
    
    // MARK: Table update
//    func updateTable() {
//        self.showFioriLoadingIndicator()
//        let oq = OperationQueue()
//        oq.addOperation({
//            self.loadData {
//                self.hideFioriLoadingIndicator()
//            }
//        })
//    }
    
    private func loadData(completionHandler: @escaping () -> Void) {
        self.requestEntities { error in
            defer {
                completionHandler()
            }
            if let error = error {
                let alertController = UIAlertController(title: NSLocalizedString("keyErrorLoadingData", value: "Loading data failed!", comment: "XTIT: Title of loading data error pop up."), message: error.localizedDescription, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: self.okTitle, style: .default))
                OperationQueue.main.addOperation({
                    // Present the alertController
                    self.present(alertController, animated: true)
                })
                self.logger.error("Could not update table. Error: \(error)", error: error)
                return
            }
            OperationQueue.main.addOperation({
                self.tableView.reloadData()
                self.logger.info("Table updated successfully!")
            })
        }
    }
    
    @objc func refresh() {
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                OperationQueue.main.addOperation({
                    self.refreshControl?.endRefreshing()
                })
            }
        })
    }
}
