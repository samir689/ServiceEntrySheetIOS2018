// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

internal class YMSESAPPROVALSRVEntitiesMetadataChanges {
    static func merge(metadata: CSDLDocument) {
        metadata.hasGeneratedProxies = true
        YMSESAPPROVALSRVEntitiesMetadata.document = metadata
        YMSESAPPROVALSRVEntitiesMetadataChanges.merge1(metadata: metadata)
        try! YMSESAPPROVALSRVEntitiesFactory.registerAll()
    }

    private static func merge1(metadata: CSDLDocument) {
        Ignore.valueOf_any(metadata)
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.Notification")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.Subscription")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_APPROVE")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_CREATE")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_ITEMS")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_SEARH_HELP")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView = metadata.entityType(withName: "YM_SES_APPROVAL_SRV.YM_SES_IOS_VIEW")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.notificationCollection = metadata.entitySet(withName: "NotificationCollection")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.subscriptionCollection = metadata.entitySet(withName: "SubscriptionCollection")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSAPPROVESet = metadata.entitySet(withName: "YM_SES_IOS_APPROVESet")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSCREATESet = metadata.entitySet(withName: "YM_SES_IOS_CREATESet")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSITEMSSet = metadata.entitySet(withName: "YM_SES_IOS_ITEMSSet")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSSEARHHELPSet = metadata.entitySet(withName: "YM_SES_IOS_SEARH_HELPSet")
        }
        if !YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet.isRemoved {
            YMSESAPPROVALSRVEntitiesMetadata.EntitySets.ymSESIOSVIEWSet = metadata.entitySet(withName: "YM_SES_IOS_VIEWSet")
        }
        if !Notification.id.isRemoved {
            Notification.id = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "ID")
        }
        if !Notification.collection.isRemoved {
            Notification.collection = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "collection")
        }
        if !Notification.title.isRemoved {
            Notification.title = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "title")
        }
        if !Notification.updated.isRemoved {
            Notification.updated = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "updated")
        }
        if !Notification.changeType.isRemoved {
            Notification.changeType = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "changeType")
        }
        if !Notification.entriesOfInterest.isRemoved {
            Notification.entriesOfInterest = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "entriesOfInterest")
        }
        if !Notification.recipient.isRemoved {
            Notification.recipient = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "recipient")
        }
        if !Subscription.id.isRemoved {
            Subscription.id = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "ID")
        }
        if !Subscription.user.isRemoved {
            Subscription.user = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "user")
        }
        if !Subscription.updated.isRemoved {
            Subscription.updated = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "updated")
        }
        if !Subscription.title.isRemoved {
            Subscription.title = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "title")
        }
        if !Subscription.deliveryAddress.isRemoved {
            Subscription.deliveryAddress = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "deliveryAddress")
        }
        if !Subscription.persistNotifications.isRemoved {
            Subscription.persistNotifications = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "persistNotifications")
        }
        if !Subscription.collection.isRemoved {
            Subscription.collection = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "collection")
        }
        if !Subscription.filter.isRemoved {
            Subscription.filter = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "filter")
        }
        if !Subscription.select.isRemoved {
            Subscription.select = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "select")
        }
        if !Subscription.changeType.isRemoved {
            Subscription.changeType = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "changeType")
        }
        if !YmSesIosApprove.lblni.isRemoved {
            YmSesIosApprove.lblni = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lblni")
        }
        if !YmSesIosApprove.sesTxz01.isRemoved {
            YmSesIosApprove.sesTxz01 = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "SesTxz01")
        }
        if !YmSesIosApprove.sbnamag.isRemoved {
            YmSesIosApprove.sbnamag = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Sbnamag")
        }
        if !YmSesIosApprove.ernam.isRemoved {
            YmSesIosApprove.ernam = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Ernam")
        }
        if !YmSesIosApprove.lwert.isRemoved {
            YmSesIosApprove.lwert = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lwert")
        }
        if !YmSesIosApprove.lbldt.isRemoved {
            YmSesIosApprove.lbldt = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lbldt")
        }
        if !YmSesIosApprove.bsart.isRemoved {
            YmSesIosApprove.bsart = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Bsart")
        }
        if !YmSesIosApprove.lifnr.isRemoved {
            YmSesIosApprove.lifnr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lifnr")
        }
        if !YmSesIosApprove.ebeln.isRemoved {
            YmSesIosApprove.ebeln = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Ebeln")
        }
        if !YmSesIosApprove.ebelp.isRemoved {
            YmSesIosApprove.ebelp = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Ebelp")
        }
        if !YmSesIosApprove.poTxzo1.isRemoved {
            YmSesIosApprove.poTxzo1 = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "PoTxzo1")
        }
        if !YmSesIosApprove.netpr.isRemoved {
            YmSesIosApprove.netpr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Netpr")
        }
        if !YmSesIosApprove.wiID.isRemoved {
            YmSesIosApprove.wiID = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "WiId")
        }
        if !YmSesIosApprove.appFlag.isRemoved {
            YmSesIosApprove.appFlag = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "AppFlag")
        }
        if !YmSesIosApprove.eindt.isRemoved {
            YmSesIosApprove.eindt = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Eindt")
        }
        if !YmSesIosApprove.netCurr.isRemoved {
            YmSesIosApprove.netCurr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "NetCurr")
        }
        if !YmSesIosApprove.poCurr.isRemoved {
            YmSesIosApprove.poCurr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "PoCurr")
        }
        if !YmSesIosApprove.headToItems.isRemoved {
            YmSesIosApprove.headToItems = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "HeadToItems")
        }
        if !YmSesIosApprove.ymSESIOSITEMSSet.isRemoved {
            YmSesIosApprove.ymSESIOSITEMSSet = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "YM_SES_IOS_ITEMSSet")
        }
        if !YmSesIosCreate.sheetNo.isRemoved {
            YmSesIosCreate.sheetNo = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "SheetNo")
        }
        if !YmSesIosCreate.personInt.isRemoved {
            YmSesIosCreate.personInt = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "PersonInt")
        }
        if !YmSesIosCreate.shortText.isRemoved {
            YmSesIosCreate.shortText = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "ShortText")
        }
        if !YmSesIosCreate.poNumber.isRemoved {
            YmSesIosCreate.poNumber = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "PoNumber")
        }
        if !YmSesIosCreate.poItem.isRemoved {
            YmSesIosCreate.poItem = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "PoItem")
        }
        if !YmSesIosCreate.note.isRemoved {
            YmSesIosCreate.note = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "Note")
        }
        if !YmSesIosItems.extrow.isRemoved {
            YmSesIosItems.extrow = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Extrow")
        }
        if !YmSesIosItems.ebeln.isRemoved {
            YmSesIosItems.ebeln = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Ebeln")
        }
        if !YmSesIosItems.menge.isRemoved {
            YmSesIosItems.menge = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Menge")
        }
        if !YmSesIosItems.tbtwr.isRemoved {
            YmSesIosItems.tbtwr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Tbtwr")
        }
        if !YmSesIosItems.waers.isRemoved {
            YmSesIosItems.waers = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Waers")
        }
        if !YmSesIosItems.netwr.isRemoved {
            YmSesIosItems.netwr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Netwr")
        }
        if !YmSesIosItems.ktext1.isRemoved {
            YmSesIosItems.ktext1 = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Ktext1")
        }
        if !YmSesIosItems.packno.isRemoved {
            YmSesIosItems.packno = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Packno")
        }
        if !YmSesIosItems.introw.isRemoved {
            YmSesIosItems.introw = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Introw")
        }
        if !YmSesIosSearhHelp.ebeln.isRemoved {
            YmSesIosSearhHelp.ebeln = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp.property(withName: "Ebeln")
        }
        if !YmSesIosSearhHelp.ebelp.isRemoved {
            YmSesIosSearhHelp.ebelp = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp.property(withName: "Ebelp")
        }
        if !YmSesIosView.sesTxz01.isRemoved {
            YmSesIosView.sesTxz01 = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "SesTxz01")
        }
        if !YmSesIosView.lblni.isRemoved {
            YmSesIosView.lblni = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lblni")
        }
        if !YmSesIosView.sbnamag.isRemoved {
            YmSesIosView.sbnamag = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Sbnamag")
        }
        if !YmSesIosView.ernam.isRemoved {
            YmSesIosView.ernam = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Ernam")
        }
        if !YmSesIosView.lwert.isRemoved {
            YmSesIosView.lwert = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lwert")
        }
        if !YmSesIosView.lbldt.isRemoved {
            YmSesIosView.lbldt = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lbldt")
        }
        if !YmSesIosView.bsart.isRemoved {
            YmSesIosView.bsart = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Bsart")
        }
        if !YmSesIosView.lifnr.isRemoved {
            YmSesIosView.lifnr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lifnr")
        }
        if !YmSesIosView.ebeln.isRemoved {
            YmSesIosView.ebeln = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Ebeln")
        }
        if !YmSesIosView.ebelp.isRemoved {
            YmSesIosView.ebelp = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Ebelp")
        }
        if !YmSesIosView.poTxzo1.isRemoved {
            YmSesIosView.poTxzo1 = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "PoTxzo1")
        }
        if !YmSesIosView.netpr.isRemoved {
            YmSesIosView.netpr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Netpr")
        }
        if !YmSesIosView.wiID.isRemoved {
            YmSesIosView.wiID = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "WiId")
        }
        if !YmSesIosView.eindt.isRemoved {
            YmSesIosView.eindt = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Eindt")
        }
        if !YmSesIosView.netCurr.isRemoved {
            YmSesIosView.netCurr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "NetCurr")
        }
        if !YmSesIosView.poCurr.isRemoved {
            YmSesIosView.poCurr = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "PoCurr")
        }
        if !YmSesIosView.viewheadToItems.isRemoved {
            YmSesIosView.viewheadToItems = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "ViewheadToItems")
        }
    }
}
