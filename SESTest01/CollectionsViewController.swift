//
// CollectionsViewController.swift
// SESTest01
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 03/12/18
//

import Foundation
import SAPFiori
import SAPOData

protocol EntityUpdaterDelegate {
    func entityHasChanged(_ entity: EntityValue?)
}

protocol EntitySetUpdaterDelegate {
    func entitySetHasChanged()
}

class CollectionsViewController: FUIFormTableViewController {
    private var collections = CollectionType.all

    // Variable to store the selected index path
    private var selectedIndex: IndexPath?

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    private let okTitle = NSLocalizedString("keyOkButtonTitle",
                                            value: "OK",
                                            comment: "XBUT: Title of OK button.")

    var isPresentedInSplitView: Bool {
        return !(self.splitViewController?.isCollapsed ?? true)
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 320, height: 480)

        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.makeSelection()
    }

    override func viewWillTransition(to _: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: { _ in
            let isNotInSplitView = !self.isPresentedInSplitView
            self.tableView.visibleCells.forEach { cell in
                // To refresh the disclosure indicator of each cell
                cell.accessoryType = isNotInSplitView ? .disclosureIndicator : .none
            }
            self.makeSelection()
        })
    }

    // MARK: - UITableViewDelegate

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.collections.count
    }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat {
        return 44
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FUIObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIObjectTableViewCell
        cell.headlineLabel.text = self.collections[indexPath.row].rawValue
        cell.accessoryType = !self.isPresentedInSplitView ? .disclosureIndicator : .none
        cell.isMomentarySelection = false
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        self.collectionSelected(at: indexPath)
    }

    // CollectionType selection helper

    private func collectionSelected(at: IndexPath) {
        // Load the EntityType specific ViewController from the specific storyboard
        var masterViewController: UIViewController!
        switch self.collections[at.row] {
        case .subscriptionCollection:
            let subscriptionStoryBoard = UIStoryboard(name: "Subscription", bundle: nil)
            masterViewController = subscriptionStoryBoard.instantiateViewController(withIdentifier: "SubscriptionMaster")
            (masterViewController as! SubscriptionMasterViewController).entitySetName = "SubscriptionCollection"
            func fetchSubscriptionCollection(_ completionHandler: @escaping ([Subscription]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchSubscriptionCollection(matching: query) { subscriptionCollection, error in
                        if error == nil {
                            completionHandler(subscriptionCollection, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! SubscriptionMasterViewController).loadEntitiesBlock = fetchSubscriptionCollection
            masterViewController.navigationItem.title = "Subscription"
        case .ymsesiossearhhelpSet:
            let ymSesIosSearhHelpStoryBoard = UIStoryboard(name: "YmSesIosSearhHelp", bundle: nil)
            masterViewController = ymSesIosSearhHelpStoryBoard.instantiateViewController(withIdentifier: "YmSesIosSearhHelpMaster")
            (masterViewController as! YmSesIosSearhHelpMasterViewController).entitySetName = "YMSESIOSSEARHHELPSet"
            func fetchYMSESIOSSEARHHELPSet(_ completionHandler: @escaping ([YmSesIosSearhHelp]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchYMSESIOSSEARHHELPSet(matching: query) { yMSESIOSSEARHHELPSet, error in
                        if error == nil {
                            completionHandler(yMSESIOSSEARHHELPSet, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! YmSesIosSearhHelpMasterViewController).loadEntitiesBlock = fetchYMSESIOSSEARHHELPSet
            masterViewController.navigationItem.title = "YmSesIosSearhHelp"
        case .ymsesioscreateSet:
            let ymSesIosCreateStoryBoard = UIStoryboard(name: "YmSesIosCreate", bundle: nil)
            masterViewController = ymSesIosCreateStoryBoard.instantiateViewController(withIdentifier: "YmSesIosCreateMaster")
            (masterViewController as! YmSesIosCreateMasterViewController).entitySetName = "YMSESIOSCREATESet"
            func fetchYMSESIOSCREATESet(_ completionHandler: @escaping ([YmSesIosCreate]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchYMSESIOSCREATESet(matching: query) { yMSESIOSCREATESet, error in
                        if error == nil {
                            completionHandler(yMSESIOSCREATESet, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! YmSesIosCreateMasterViewController).loadEntitiesBlock = fetchYMSESIOSCREATESet
            masterViewController.navigationItem.title = "YmSesIosCreate"
        case .ymsesiosviewSet:
            let ymSesIosViewStoryBoard = UIStoryboard(name: "YmSesIosView", bundle: nil)
            masterViewController = ymSesIosViewStoryBoard.instantiateViewController(withIdentifier: "YmSesIosViewMaster")
            (masterViewController as! YmSesIosViewMasterViewController).entitySetName = "YMSESIOSVIEWSet"
            func fetchYMSESIOSVIEWSet(_ completionHandler: @escaping ([YmSesIosView]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchYMSESIOSVIEWSet(matching: query) { yMSESIOSVIEWSet, error in
                        if error == nil {
                            completionHandler(yMSESIOSVIEWSet, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! YmSesIosViewMasterViewController).loadEntitiesBlock = fetchYMSESIOSVIEWSet
            masterViewController.navigationItem.title = "YmSesIosView"
        case .ymsesiositemsSet:
            let ymSesIosItemsStoryBoard = UIStoryboard(name: "YmSesIosItems", bundle: nil)
            masterViewController = ymSesIosItemsStoryBoard.instantiateViewController(withIdentifier: "YmSesIosItemsMaster")
            (masterViewController as! YmSesIosItemsMasterViewController).entitySetName = "YMSESIOSITEMSSet"
            func fetchYMSESIOSITEMSSet(_ completionHandler: @escaping ([YmSesIosItems]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchYMSESIOSITEMSSet(matching: query) { yMSESIOSITEMSSet, error in
                        if error == nil {
                            completionHandler(yMSESIOSITEMSSet, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! YmSesIosItemsMasterViewController).loadEntitiesBlock = fetchYMSESIOSITEMSSet
            masterViewController.navigationItem.title = "YmSesIosItems"
        case .notificationCollection:
            let notificationStoryBoard = UIStoryboard(name: "Notification", bundle: nil)
            masterViewController = notificationStoryBoard.instantiateViewController(withIdentifier: "NotificationMaster")
            (masterViewController as! NotificationMasterViewController).entitySetName = "NotificationCollection"
            func fetchNotificationCollection(_ completionHandler: @escaping ([Notification]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchNotificationCollection(matching: query) { notificationCollection, error in
                        if error == nil {
                            completionHandler(notificationCollection, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! NotificationMasterViewController).loadEntitiesBlock = fetchNotificationCollection
            masterViewController.navigationItem.title = "Notification"
        case .ymsesiosapproveSet:
            let ymSesIosApproveStoryBoard = UIStoryboard(name: "YmSesIosApprove", bundle: nil)
            masterViewController = ymSesIosApproveStoryBoard.instantiateViewController(withIdentifier: "YmSesIosApproveMaster")
            (masterViewController as! YmSesIosApproveMasterViewController).entitySetName = "YMSESIOSAPPROVESet"
            func fetchYMSESIOSAPPROVESet(_ completionHandler: @escaping ([YmSesIosApprove]?, Error?) -> Void) {
                // Only request the first 20 values. If you want to modify the requested entities, you can do it here.
                let query = DataQuery().selectAll().top(20)
                do {
                    self.appDelegate.ymsesapprovalsrvEntities!.fetchYMSESIOSAPPROVESet(matching: query) { yMSESIOSAPPROVESet, error in
                        if error == nil {
                            completionHandler(yMSESIOSAPPROVESet, nil)
                        } else {
                            completionHandler(nil, error)
                        }
                    }
                }
            }
            (masterViewController as! YmSesIosApproveMasterViewController).loadEntitiesBlock = fetchYMSESIOSAPPROVESet
            masterViewController.navigationItem.title = "YmSesIosApprove"
        case .none:
            masterViewController = UIViewController()
        }

        // Load the NavigationController and present with the EntityType specific ViewController
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let rightNavigationController = mainStoryBoard.instantiateViewController(withIdentifier: "RightNavigationController") as! UINavigationController
        rightNavigationController.viewControllers = [masterViewController]
        self.splitViewController?.showDetailViewController(rightNavigationController, sender: nil)
    }

    // MARK: - Handle highlighting of selected cell

    private func makeSelection() {
        if let selectedIndex = selectedIndex {
            self.tableView.selectRow(at: selectedIndex, animated: true, scrollPosition: .none)
            self.tableView.scrollToRow(at: selectedIndex, at: .none, animated: true)
        } else {
            self.selectDefault()
        }
    }

    private func selectDefault() {
        // Automatically select first element if we have two panels (iPhone plus and iPad only)
        if self.splitViewController!.isCollapsed || self.appDelegate.ymsesapprovalsrvEntities == nil {
            return
        }
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: .middle)
        self.collectionSelected(at: indexPath)
    }
}
