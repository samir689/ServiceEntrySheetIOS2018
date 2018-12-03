// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

public class YMSESAPPROVALSRVEntitiesMetadata {
    private static var document_: CSDLDocument = YMSESAPPROVALSRVEntitiesMetadata.resolve()

    public static var document: CSDLDocument {
        get {
            objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.self)
            defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.self) }
            do {
                return YMSESAPPROVALSRVEntitiesMetadata.document_
            }
        }
        set(value) {
            objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.self)
            defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.self) }
            do {
                YMSESAPPROVALSRVEntitiesMetadata.document_ = value
            }
        }
    }

    private static func resolve() -> CSDLDocument {
        try! YMSESAPPROVALSRVEntitiesFactory.registerAll()
        YMSESAPPROVALSRVEntitiesMetadataParser.parsed.hasGeneratedProxies = true
        return YMSESAPPROVALSRVEntitiesMetadataParser.parsed
    }

    public class EntityTypes {
        private static var notification_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.Notification")

        private static var subscription_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.Subscription")

        private static var ymSesIosApprove_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_APPROVE")

        private static var ymSesIosCreate_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_CREATE")

        private static var ymSesIosItems_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_ITEMS")

        private static var ymSesIosSearhHelp_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_SEARH_HELP")

        private static var ymSesIosView_: EntityType = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_VIEW")

        public static var notification: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification_ = value
                }
            }
        }

        public static var subscription: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription_ = value
                }
            }
        }

        public static var ymSesIosApprove: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove_ = value
                }
            }
        }

        public static var ymSesIosCreate: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate_ = value
                }
            }
        }

        public static var ymSesIosItems: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems_ = value
                }
            }
        }

        public static var ymSesIosSearhHelp: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp_ = value
                }
            }
        }

        public static var ymSesIosView: EntityType {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView_ = value
                }
            }
        }
    }

    public class EntitySets {
        private static var notificationCollection_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "NotificationCollection")

        private static var subscriptionCollection_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "SubscriptionCollection")

        private static var ymSESIOSAPPROVESet_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "YM_SES_IOS_APPROVESet")

        private static var ymSESIOSCREATESet_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "YM_SES_IOS_CREATESet")

        private static var ymSESIOSITEMSSet_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "YM_SES_IOS_ITEMSSet")

        private static var ymSESIOSSEARHHELPSet_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "YM_SES_IOS_SEARH_HELPSet")

        private static var ymSESIOSVIEWSet_: EntitySet = YMSESAPPROVALSRVEntitiesMetadataParser.parsed.entitySet(withName: "YM_SES_IOS_VIEWSet")

        public static var notificationCollection: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection_ = value
                }
            }
        }

        public static var subscriptionCollection: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection_ = value
                }
            }
        }

        public static var ymSESIOSAPPROVESet: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet_ = value
                }
            }
        }

        public static var ymSESIOSCREATESet: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet_ = value
                }
            }
        }

        public static var ymSESIOSITEMSSet: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet_ = value
                }
            }
        }

        public static var ymSESIOSSEARHHELPSet: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet_ = value
                }
            }
        }

        public static var ymSESIOSVIEWSet: EntitySet {
            get {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    return YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet_
                }
            }
            set(value) {
                objc_sync_enter(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self)
                defer { objc_sync_exit(YMSESAPPROVALSRVEntitiesMetadata.EntitySets.self) }
                do {
                    YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet_ = value
                }
            }
        }
    }
}
