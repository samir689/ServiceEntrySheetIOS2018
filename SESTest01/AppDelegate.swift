//
// AppDelegate.swift
// SESTest01
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 03/12/18
//

import SAPCommon
import SAPFiori
import SAPFioriFlows
import SAPFoundation
import SAPOData
import SAPOfflineOData
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate, OnboardingManagerDelegate, ConnectivityObserver, UNUserNotificationCenterDelegate {
    var window: UIWindow?

    private let logger = Logger.shared(named: "AppDelegateLogger")
    var ymsesapprovalsrvEntities: YMSESAPPROVALSRVEntities<OfflineODataProvider>!
    private(set) var isOfflineStoreOpened = false

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Set a FUIInfoViewController as the rootViewController, since there it is none set in the Main.storyboard
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()

        do {
            // Attaches a LogUploadFileHandler instance to the root of the logging system
            try SAPcpmsLogUploader.attachToRootLogger()
        } catch {
            self.logger.error("Failed to attach to root logger.", error: error)
        }

        UINavigationBar.applyFioriStyle()

        ConnectivityReceiver.registerObserver(self)
        OnboardingManager.shared.delegate = self
        OnboardingManager.shared.onboardOrRestore()

        return true
    }

    // To only support portrait orientation during onboarding
    func application(_: UIApplication, supportedInterfaceOrientationsFor _: UIWindow?) -> UIInterfaceOrientationMask {
        switch OnboardingFlowController.presentationState {
        case .onboarding, .restoring:
            return .portrait
        default:
            return .allButUpsideDown
        }
    }

    // Delegate to OnboardingManager.
    func applicationDidEnterBackground(_: UIApplication) {
        OnboardingManager.shared.applicationDidEnterBackground()
        self.closeOfflineStore()
    }

    // Delegate to OnboardingManager.
    func applicationWillEnterForeground(_: UIApplication) {
        OnboardingManager.shared.applicationWillEnterForeground {
            self.openOfflineStore(onboarding: false)
        }
    }

    func onboarded(onboardingContext: OnboardingContext, onboarding: Bool) {
        // Adjust this path so it can be called after authentication and returns an HTTP 200 code. This is used to validate the authentication was successful.
        let configurationURL = URL(string: "https://mobile-b97bb358c.us1.hana.ondemand.com/SES_Approval")!
        self.configureOData(onboardingContext.sapURLSession, configurationURL, onboarding)

        self.uploadLogs(onboardingContext.sapURLSession, onboardingContext.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters)
        self.registerForRemoteNotification(onboardingContext.sapURLSession, onboardingContext.info[.sapcpmsSettingsParameters] as! SAPcpmsSettingsParameters)

        self.openOfflineStore(onboarding: onboarding)
    }

    private func setRootViewController() {
        DispatchQueue.main.async {
            let splitViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainSplitViewController") as! UISplitViewController
            splitViewController.delegate = self
            splitViewController.modalPresentationStyle = .currentContext
            splitViewController.preferredDisplayMode = .allVisible
            self.window!.rootViewController = splitViewController
        }
    }

    // MARK: - Split view

    func splitViewController(_: UISplitViewController, collapseSecondary _: UIViewController, onto _: UIViewController) -> Bool {
        // The first Collection will be selected automatically, so we never discard showing the secondary ViewController
        return false
    }

    // MARK: - Remote Notification handling

    private var deviceToken: Data?

    func application(_: UIApplication, willFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        UIApplication.shared.registerForRemoteNotifications()
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { _, _ in
            // Enable or disable features based on authorization.
        }
        center.delegate = self
        return true
    }

    // Called to let your app know which action was selected by the user for a given notification.
    func userNotificationCenter(_: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        self.logger.info("App opened via user selecting notification: \(response.notification.request.content.body)")
        // Here is where you want to take action to handle the notification, maybe navigate the user to a given screen.
        completionHandler()
    }

    // Called when a notification is delivered to a foreground app.
    func userNotificationCenter(_: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        self.logger.info("Remote Notification arrived while app was in foreground: \(notification.request.content.body)")
        // Currently we are presenting the notification alert as the application were in the background.
        // If you have handled the notification and do not want to display an alert, call the completionHandler with empty options: completionHandler([])
        completionHandler([.alert, .sound])
    }

    func registerForRemoteNotification(_ urlSession: SAPURLSession, _ settingsParameters: SAPcpmsSettingsParameters) {
        guard let deviceToken = self.deviceToken else {
            // Device token has not been acquired
            return
        }

        let remoteNotificationClient = SAPcpmsRemoteNotificationClient(sapURLSession: urlSession, settingsParameters: settingsParameters)
        remoteNotificationClient.registerDeviceToken(deviceToken) { error in
            if let error = error {
                self.logger.error("Register DeviceToken failed", error: error)
                return
            }
            self.logger.info("Register DeviceToken succeeded")
        }
    }

    func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        self.deviceToken = deviceToken
    }

    func application(_: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        self.logger.error("Failed to register for Remote Notification", error: error)
    }

    // MARK: - Log uploading

    // This function is invoked on every application start, but you can reuse it to manually trigger the logupload.
    private func uploadLogs(_ urlSession: SAPURLSession, _ settingsParameters: SAPcpmsSettingsParameters) {
        SAPcpmsLogUploader.uploadLogs(sapURLSession: urlSession, settingsParameters: settingsParameters) { error in
            if let error = error {
                self.logger.error("Error happened during log upload.", error: error)
                return
            }
            self.logger.info("Logs have been uploaded successfully.")
        }
    }

    // MARK: - Configure Offline OData

    private func configureOData(_ urlSession: SAPURLSession, _ serviceRoot: URL, _ onboarding: Bool) {
        var offlineParameters = OfflineODataParameters()
        offlineParameters.enableRepeatableRequests = true
        // Setup an instance of delegate. See sample code below for definition of OfflineODataDelegateSample class.
        let delegate = OfflineODataDelegateSample()
        let offlineODataProvider = try! OfflineODataProvider(serviceRoot: serviceRoot, parameters: offlineParameters, sapURLSession: urlSession, delegate: delegate)
        if onboarding {
            do {
                // Although it is not the best practice, we are defining this query limit as top=20.
                // If the service supports paging, then paging should be used instead of top!
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection).selectAll().top(20), automaticallyRetrievesStreams: false))
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet).selectAll().top(20), automaticallyRetrievesStreams: false))
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet).selectAll().top(20), automaticallyRetrievesStreams: false))
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet).selectAll().top(20), automaticallyRetrievesStreams: false))
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet).selectAll().top(20), automaticallyRetrievesStreams: false))
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection).selectAll().top(20), automaticallyRetrievesStreams: false))
                try offlineODataProvider.add(definingQuery: OfflineODataDefiningQuery(name: YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet.localName, query: DataQuery().from(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet).selectAll().top(20), automaticallyRetrievesStreams: false))
            } catch {
                self.logger.error("Failed to add defining query for Offline Store initialization", error: error)
            }
        }
        self.ymsesapprovalsrvEntities = YMSESAPPROVALSRVEntities(provider: offlineODataProvider)
    }

    fileprivate func showOfflineODataError(_ error: OfflineODataError, message: String) {
        DispatchQueue.main.async(execute: {
            let errorOfflineInfoVC = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()
            errorOfflineInfoVC.informationTextView.text = "\(message): \(error)"
            errorOfflineInfoVC.informationTextView.textColor = UIColor.black
            errorOfflineInfoVC.informationTextView.textAlignment = .center
            errorOfflineInfoVC.informationTextView.isHidden = false
            errorOfflineInfoVC.loadingIndicatorView.dismiss()
            self.window!.rootViewController = errorOfflineInfoVC
        })
    }

    private func performOfflineRefresh() {
        self.uploadOfflineStore()
        self.downloadOfflineStore()
    }

    private func openOfflineStore(onboarding: Bool) {
        DispatchQueue.main.async {
            let openingOfflineInfoVC = FUIInfoViewController.createSplashScreenInstanceFromStoryboard()
            openingOfflineInfoVC.informationTextView.text = "Opening and Syncing Offline Store."
            openingOfflineInfoVC.informationTextView.textAlignment = .center
            openingOfflineInfoVC.informationTextView.textColor = UIColor.black
            openingOfflineInfoVC.informationTextView.isHidden = false
            self.window!.rootViewController = openingOfflineInfoVC
        }
        if !self.isOfflineStoreOpened {
            // The OfflineODataProvider needs to be opened before performing any operations.
            self.ymsesapprovalsrvEntities.open { error in
                if let error = error {
                    self.logger.error("Could not open offline store.", error: error)
                    self.showOfflineODataError(error, message: "Could not open offline store")
                    return
                }
                self.isOfflineStoreOpened = true
                self.logger.info("Offline store opened.")
                if !onboarding {
                    // You might want to consider doing the synchronization based on an explicit user interaction instead of automatically synchronizing during startup
                    self.performOfflineRefresh()
                } else {
                    self.setRootViewController()
                }
            }
        } else if !onboarding {
            // You might want to consider doing the synchronization based on an explicit user interaction instead of automatically synchronizing during startup
            self.performOfflineRefresh()
        }
    }

    private func closeOfflineStore() {
        if self.isOfflineStoreOpened {
            do {
                // the Offline store should be closed when it is no longer used.
                try self.ymsesapprovalsrvEntities.close()
                self.isOfflineStoreOpened = false
            } catch {
                self.logger.error("Offline Store closing failed.")
            }
        }
        self.logger.info("Offline Store closed.")
    }

    private func downloadOfflineStore() {
        if !self.isOfflineStoreOpened {
            self.logger.error("Offline Store still closed")
            return
        }
        // the download function updates the client’s offline store from the backend.
        self.ymsesapprovalsrvEntities.download { error in
            if let error = error {
                self.logger.error("Offline Store download failed.", error: error)
            } else {
                self.logger.info("Offline Store is downloaded.")
            }
            self.setRootViewController()
        }
    }

    private func uploadOfflineStore() {
        if !self.isOfflineStoreOpened {
            self.logger.error("Offline Store still closed")
            return
        }
        // the upload function updates the backend from the client’s offline store.
        self.ymsesapprovalsrvEntities.upload { error in
            if let error = error {
                self.logger.error("Offline Store upload failed.", error: error)
                return
            }
            self.logger.info("Offline Store is uploaded.")
        }
    }

    // MARK: - ConnectivityObserver implementation

    func connectionEstablished() {
        // connection established
    }

    func connectionChanged(_ previousReachabilityType: ReachabilityType, reachabilityType _: ReachabilityType) {
        // connection changed
        if case previousReachabilityType = ReachabilityType.offline {
            // connection established
            OnboardingManager.shared.restoreForSyncing()
        }
    }

    func connectionLost() {
        // connection lost
    }
}

class OfflineODataDelegateSample: OfflineODataDelegate {
    private let logger = Logger.shared(named: "AppDelegateLogger")

    public func offlineODataProvider(_: OfflineODataProvider, didUpdateDownloadProgress progress: OfflineODataProgress) {
        self.logger.debug("downloadProgress: \(progress.bytesSent)  \(progress.bytesReceived)")
    }

    public func offlineODataProvider(_: OfflineODataProvider, didUpdateFileDownloadProgress progress: OfflineODataFileDownloadProgress) {
        self.logger.debug("downloadProgress: \(progress.bytesReceived)  \(progress.fileSize)")
    }

    public func offlineODataProvider(_: OfflineODataProvider, didUpdateUploadProgress progress: OfflineODataProgress) {
        self.logger.debug("downloadProgress: \(progress.bytesSent)  \(progress.bytesReceived)")
    }

    public func offlineODataProvider(_: OfflineODataProvider, requestDidFail request: OfflineODataFailedRequest) {
        self.logger.error("requestFailed: \(request.httpStatusCode)")
    }

    // The OfflineODataStoreState is a Swift OptionSet. Use the set operation to retrieve each setting.
    private func storeState2String(_ state: OfflineODataStoreState) -> String {
        var result = ""
        if state.contains(.opening) {
            result = result + ":opening"
        }
        if state.contains(.open) {
            result = result + ":open"
        }
        if state.contains(.closed) {
            result = result + ":closed"
        }
        if state.contains(.downloading) {
            result = result + ":downloading"
        }
        if state.contains(.uploading) {
            result = result + ":uploading"
        }
        if state.contains(.initializing) {
            result = result + ":initializing"
        }
        if state.contains(.fileDownloading) {
            result = result + ":fileDownloading"
        }
        if state.contains(.initialCommunication) {
            result = result + ":initialCommunication"
        }
        return result
    }

    public func offlineODataProvider(_: OfflineODataProvider, stateDidChange newState: OfflineODataStoreState) {
        let stateString = storeState2String(newState)
        self.logger.debug("stateChanged: \(stateString)")
    }
}
