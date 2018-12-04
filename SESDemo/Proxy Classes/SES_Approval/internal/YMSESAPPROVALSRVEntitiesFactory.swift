// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

internal class YMSESAPPROVALSRVEntitiesFactory {
    static func registerAll() throws {
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.registerFactory(ObjectFactory.with(create: { Notification(withDefaults: false) }, createWithDecoder: { d in try Notification(from: d) }))
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.registerFactory(ObjectFactory.with(create: { Subscription(withDefaults: false) }, createWithDecoder: { d in try Subscription(from: d) }))
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.registerFactory(ObjectFactory.with(create: { YmSesIosApprove(withDefaults: false) }, createWithDecoder: { d in try YmSesIosApprove(from: d) }))
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.registerFactory(ObjectFactory.with(create: { YmSesIosCreate(withDefaults: false) }, createWithDecoder: { d in try YmSesIosCreate(from: d) }))
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.registerFactory(ObjectFactory.with(create: { YmSesIosItems(withDefaults: false) }, createWithDecoder: { d in try YmSesIosItems(from: d) }))
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp.registerFactory(ObjectFactory.with(create: { YmSesIosSearhHelp(withDefaults: false) }, createWithDecoder: { d in try YmSesIosSearhHelp(from: d) }))
        YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.registerFactory(ObjectFactory.with(create: { YmSesIosView(withDefaults: false) }, createWithDecoder: { d in try YmSesIosView(from: d) }))
        YMSESAPPROVALSRVEntitiesStaticResolver.resolve()
    }
}
