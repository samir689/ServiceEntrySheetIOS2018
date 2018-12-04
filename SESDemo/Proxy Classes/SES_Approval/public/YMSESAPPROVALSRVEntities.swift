// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class YMSESAPPROVALSRVEntities<Provider: DataServiceProvider>: DataService<Provider> {
    public override init(provider: Provider) {
        super.init(provider: provider)
        self.provider.metadata = YMSESAPPROVALSRVEntitiesMetadata.document
    }

    open func fetchNotification(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Notification {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Notification>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchNotification(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Notification?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Notification = try self.fetchNotification(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchNotificationCollection(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Notification> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Notification.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection), headers: var_headers, options: var_options).entityList())
    }

    open func fetchNotificationCollection(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Notification>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Notification> = try self.fetchNotificationCollection(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSubscription(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Subscription {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<Subscription>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchSubscription(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Subscription?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Subscription = try self.fetchSubscription(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchSubscriptionCollection(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<Subscription> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try Subscription.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection), headers: var_headers, options: var_options).entityList())
    }

    open func fetchSubscriptionCollection(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<Subscription>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<Subscription> = try self.fetchSubscriptionCollection(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYMSESIOSAPPROVESet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<YmSesIosApprove> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try YmSesIosApprove.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchYMSESIOSAPPROVESet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<YmSesIosApprove>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<YmSesIosApprove> = try self.fetchYMSESIOSAPPROVESet(matching: query, headers: headers, options: options)
                print(result)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYMSESIOSCREATESet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<YmSesIosCreate> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try YmSesIosCreate.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchYMSESIOSCREATESet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<YmSesIosCreate>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<YmSesIosCreate> = try self.fetchYMSESIOSCREATESet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYMSESIOSITEMSSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<YmSesIosItems> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try YmSesIosItems.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchYMSESIOSITEMSSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<YmSesIosItems>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<YmSesIosItems> = try self.fetchYMSESIOSITEMSSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYMSESIOSSEARHHELPSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<YmSesIosSearhHelp> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try YmSesIosSearhHelp.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchYMSESIOSSEARHHELPSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<YmSesIosSearhHelp>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<YmSesIosSearhHelp> = try self.fetchYMSESIOSSEARHHELPSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYMSESIOSVIEWSet(matching query: DataQuery? = nil, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> Array<YmSesIosView> {
        let var_query: DataQuery = DataQuery.newIfNull(query: query)
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try YmSesIosView.array(from: self.executeQuery(var_query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet), headers: var_headers, options: var_options).entityList())
    }

    open func fetchYMSESIOSVIEWSet(matching query: DataQuery = DataQuery(), headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (Array<YmSesIosView>?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: Array<YmSesIosView> = try self.fetchYMSESIOSVIEWSet(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYmSesIosApprove(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> YmSesIosApprove {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<YmSesIosApprove>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchYmSesIosApprove(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (YmSesIosApprove?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: YmSesIosApprove = try self.fetchYmSesIosApprove(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYmSesIosCreate(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> YmSesIosCreate {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<YmSesIosCreate>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchYmSesIosCreate(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (YmSesIosCreate?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: YmSesIosCreate = try self.fetchYmSesIosCreate(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYmSesIosItems(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> YmSesIosItems {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<YmSesIosItems>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchYmSesIosItems(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (YmSesIosItems?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: YmSesIosItems = try self.fetchYmSesIosItems(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYmSesIosSearhHelp(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> YmSesIosSearhHelp {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<YmSesIosSearhHelp>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchYmSesIosSearhHelp(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (YmSesIosSearhHelp?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: YmSesIosSearhHelp = try self.fetchYmSesIosSearhHelp(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    open func fetchYmSesIosView(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil) throws -> YmSesIosView {
        let var_headers: HTTPHeaders = HTTPHeaders.emptyIfNull(headers: headers)
        let var_options: RequestOptions = try RequestOptions.noneIfNull(options: options)
        return try CastRequired<YmSesIosView>.from(self.executeQuery(query.fromDefault(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet), headers: var_headers, options: var_options).requiredEntity())
    }

    open func fetchYmSesIosView(matching query: DataQuery, headers: HTTPHeaders? = nil, options: RequestOptions? = nil, completionHandler: @escaping (YmSesIosView?, Error?) -> Void) {
        self.addBackgroundOperationForFunction {
            do {
                let result: YmSesIosView = try self.fetchYmSesIosView(matching: query, headers: headers, options: options)
                self.completionQueue.addOperation {
                    completionHandler(result, nil)
                }
            } catch let error {
                self.completionQueue.addOperation {
                    completionHandler(nil, error)
                }
            }
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchNotificationCollection")
    open func notificationCollection(query: DataQuery = DataQuery()) throws -> Array<Notification> {
        return try self.fetchNotificationCollection(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchNotificationCollection")
    open func notificationCollection(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Notification>?, Error?) -> Void) {
        self.fetchNotificationCollection(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    open override func refreshMetadata() throws {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        do {
            try ProxyInternal.refreshMetadata(service: self, fetcher: nil, options: YMSESAPPROVALSRVEntitiesMetadataParser.options)
            YMSESAPPROVALSRVEntitiesMetadataChanges.merge(metadata: self.metadata)
        }
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSubscriptionCollection")
    open func subscriptionCollection(query: DataQuery = DataQuery()) throws -> Array<Subscription> {
        return try self.fetchSubscriptionCollection(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchSubscriptionCollection")
    open func subscriptionCollection(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<Subscription>?, Error?) -> Void) {
        self.fetchSubscriptionCollection(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSAPPROVESet")
    open func ymSESIOSAPPROVESet(query: DataQuery = DataQuery()) throws -> Array<YmSesIosApprove> {
        return try self.fetchYMSESIOSAPPROVESet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSAPPROVESet")
    open func ymSESIOSAPPROVESet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<YmSesIosApprove>?, Error?) -> Void) {
        self.fetchYMSESIOSAPPROVESet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSCREATESet")
    open func ymSESIOSCREATESet(query: DataQuery = DataQuery()) throws -> Array<YmSesIosCreate> {
        return try self.fetchYMSESIOSCREATESet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSCREATESet")
    open func ymSESIOSCREATESet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<YmSesIosCreate>?, Error?) -> Void) {
        self.fetchYMSESIOSCREATESet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSITEMSSet")
    open func ymSESIOSITEMSSet(query: DataQuery = DataQuery()) throws -> Array<YmSesIosItems> {
        return try self.fetchYMSESIOSITEMSSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSITEMSSet")
    open func ymSESIOSITEMSSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<YmSesIosItems>?, Error?) -> Void) {
        self.fetchYMSESIOSITEMSSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSSEARHHELPSet")
    open func ymSESIOSSEARHHELPSet(query: DataQuery = DataQuery()) throws -> Array<YmSesIosSearhHelp> {
        return try self.fetchYMSESIOSSEARHHELPSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSSEARHHELPSet")
    open func ymSESIOSSEARHHELPSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<YmSesIosSearhHelp>?, Error?) -> Void) {
        self.fetchYMSESIOSSEARHHELPSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSVIEWSet")
    open func ymSESIOSVIEWSet(query: DataQuery = DataQuery()) throws -> Array<YmSesIosView> {
        return try self.fetchYMSESIOSVIEWSet(matching: query)
    }

    @available(swift, deprecated: 4.0, renamed: "fetchYMSESIOSVIEWSet")
    open func ymSESIOSVIEWSet(query: DataQuery = DataQuery(), completionHandler: @escaping (Array<YmSesIosView>?, Error?) -> Void) {
        self.fetchYMSESIOSVIEWSet(matching: query, headers: nil, options: nil, completionHandler: completionHandler)
    }
}
