//
//  MasterItemsTableViewController.swift
//  SESTest08
//
//  Created by Tamas Szuhanszky on 2018. 02. 12..
//  Copyright © 2018. SAP. All rights reserved.
//

// MARK: Custom Documentation
// Class for the Items screen

import UIKit
import Foundation
import SAPFoundation
import SAPOData
import SAPOfflineOData
import SAPFiori
import SAPCommon

class MasterItemsTableViewController: FUIFormTableViewController, SAPFioriLoadingIndicator, EntitySetUpdaterDelegate {
//    018-02-13 15:11:53.255379+0100 SESTest08[36561:917640] *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<SESTest08.MasterItemsTableViewController 0x7f81a9089a00> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key dataSource.'  --solved
    
    //TODO: for the moment this queries first 20 of a table. use the declared and passed SeS variable to query for a specific ses documents items
    //TODO: get the itemlist out of the single element in entities variable.
    //TODO: simplify the 2 query, it can be queried in one go, we dont need to query for the ses deatails and the itemdetails of the ses seperately
    
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var ymsesapprovalsrvEntities: YMSESAPPROVALSRVEntities<OnlineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntitiesOnline
    }
    
    // MARK: Offline provider and delegate
    private var ymsesapprovalsrvEntitiesOffline:  YMSESAPPROVALSRVEntities<OfflineODataProvider> {
        return self.appDelegate.ymsesapprovalsrvEntities
    }
    
  
    
    private var isStoreOpened = false
    var SeS: YmSesIosApprove?
    var tableUpdater: EntitySetUpdaterDelegate?
    
    private var entities: [YmSesIosItems] = [YmSesIosItems]()
    private var entities2: [YmSesIosApprove] = [YmSesIosApprove]()
    private let logger = Logger.shared(named: "YmSesIosItemsMasterViewConterollerLogger")
    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")
    var loadingIndicator: FUILoadingIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        // Add refreshcontrol UI
        self.refreshControl?.addTarget(self, action: #selector(self.refresh), for: UIControlEvents.valueChanged)
        //bcust self.tableView.addSubview(self.refreshControl!)
        // Cell height settings
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 98
        //self.updateTable()
        self.entitySetHasChanged()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //bcust self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Table view data source
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.entities.count - 1
    }
    
    override func tableView(_: UITableView, canEditRowAt _: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ymsesiositems = self.entities[indexPath.row + 1] //to leave the first one out
        
        let cellIdentifier = "SESItemCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MasterItemTableViewCell else {
            fatalError("Fatal Error: Cell creation")
        }
        cell.lbl_extrow.text = "\(ymsesiositems.extrow!)"
        cell.lbl_menge.text = "\(ymsesiositems.menge!)"
        cell.lbl_netwr.text = "\(ymsesiositems.netwr!)"
        cell.lbl_tbtwr.text = "\(ymsesiositems.tbtwr!)"
        cell.lbl_waers.text = "\(ymsesiositems.waers!)"
        cell.lbl_ktext1.text = "\(ymsesiositems.ktext1!)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
    
    // MARK: Data accessing
    func requestEntities(completionHandler: @escaping (Error?) -> Void) {
//        var query = DataQuery().withKey(YmSesIosApprove.key(lblni: SeS?.lblni!))
//        query = query.expand(YmSesIosApprove.headToItems)
//        print(query)
//
//        self.ymsesapprovalsrvEntities.fetchYMSESIOSAPPROVESet(matching: query) { yMSESIOSAPPROVESet, error in
//            guard let yMSESIOSAPPROVESet = yMSESIOSAPPROVESet else {
//                completionHandler(error!)
//                return
//            }
//            self.entities2 = yMSESIOSAPPROVESet
//            completionHandler(nil)
//
//            //bcust
//            self.entities = (self.entities2.first?.headToItems)!
//        }
//
        
        // MARK: Offline request implementation
        // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
        
        ymsesapprovalsrvEntitiesOffline.open { error in
            guard error == nil else {
                return;
            }
            
            self.isStoreOpened = true
            
            
            //create local database for ITEMS
            //self.ymsesapprovalsrvEntitiesOffline.
//            var offlineODataProvider = OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet.localName, query: DataQuery().withKey(YmSesIosApprove.key(lblni: self.SeS?.lblni!)), automaticallyRetrievesStreams: false)
            //DataQuery().withKey(YmSesIosApprove.key(lblni: self.SeS?.lblni!))
            //            let qquery = DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet).withKey(YmSesIosApprove.key(lblni: "1001948388"))

            
            let lblniVar = self.SeS?.lblni!
            var queryOff = DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet).withKey(YmSesIosApprove.key(lblni: lblniVar))
            print(queryOff.url)


            queryOff = queryOff.expand(YmSesIosApprove.headToItems)

            
            print(lblniVar)
//            let qquery = DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet).withKey(YmSesIosApprove.key(lblni: lblniVar))
            do{
               //self.ymsesapprovalsrvEntitiesOffline.createEntity(<#T##entity: EntityValue##EntityValue#>)
                try self.ymsesapprovalsrvEntitiesOffline.provider.add(definingQuery:
                    OfflineODataDefiningQuery(
                    name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet.localName,
                    query: queryOff, automaticallyRetrievesStreams: false))

            } catch {
                print("error")
                print(error)
                self.logger.error("Failed to add defining query for Offline Store initialization", error: error)
            }
            print(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet.localName)
            print(DataQuery().withKey(YmSesIosApprove.key(lblni: lblniVar)).expand(YmSesIosApprove.headToItems))
            
            self.downloadOfflineStore()
            
        
            
//
//            self.ymsesapprovalsrvEntitiesOffline.get = YMSESAPPROVALSRVEntities(provider: offlineODataProvider)
//
            //////
            self.ymsesapprovalsrvEntitiesOffline.download { error in
                guard error == nil else {
                    var queryOff = DataQuery().withKey(YmSesIosApprove.key(lblni: self.SeS?.lblni!))
                    queryOff = queryOff.expand(YmSesIosApprove.headToItems)
                    //var queryOff = DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet).selectAll()
                    print(queryOff)
                    self.ymsesapprovalsrvEntitiesOffline.fetchYMSESIOSAPPROVESet(matching: queryOff) { products, error in
                        guard let products = products else {
                            completionHandler(error!)
                            self.closeOfflineStore()
                            return
                        }
                        self.entities2 = products
//                        print (self.entities2.first)
//                        print (self.entities2.first?.headToItems)
                        self.entities = (self.entities2.first?.headToItems)!
                        print(self.entities)
                        completionHandler(nil)
                        self.closeOfflineStore()
                    }
                    return
                }
                
                var queryOn = DataQuery().withKey(YmSesIosApprove.key(lblni: self.SeS?.lblni!))
                queryOn = queryOn.expand(YmSesIosApprove.headToItems)
                print(queryOn)
                self.ymsesapprovalsrvEntities.fetchYMSESIOSAPPROVESet(matching: queryOn) { yMSESIOSAPPROVESet, error in
                    guard let yMSESIOSAPPROVESet = yMSESIOSAPPROVESet else {
                        completionHandler(error!)
                        return
                    }
                    self.entities2 = yMSESIOSAPPROVESet
//                    print (self.entities2.first)
//                    print (self.entities2.first?.headToItems)
                    self.entities = (self.entities2.first?.headToItems)!
                    
                    completionHandler(nil)
                }
            }
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
    
    func entitySetHasChanged() {
        self.showFioriLoadingIndicator()
        let oq = OperationQueue()
        oq.addOperation({
            self.loadData {
                self.hideFioriLoadingIndicator()
            }
        })
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
    
    private func downloadOfflineStore() {
        if !self.isStoreOpened {
            self.logger.error("Offline Store still closed")
            return
        }
        // the download function updates the client’s offline store from the backend.
        self.ymsesapprovalsrvEntitiesOffline.download { error in
            if let error = error {
                self.logger.error("Offline Store download failed.", error: error)
            } else {
                self.logger.info("Offline Store is downloaded.")
            }
        }
    }

    
}

