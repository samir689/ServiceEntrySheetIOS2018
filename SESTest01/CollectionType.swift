//
// CollectionType.swift
// SESTest01
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 03/12/18
//

import Foundation

enum CollectionType: String {
    case subscriptionCollection = "SubscriptionCollection"
    case ymsesiossearhhelpSet = "YMSESIOSSEARHHELPSet"
    case ymsesioscreateSet = "YMSESIOSCREATESet"
    case ymsesiosviewSet = "YMSESIOSVIEWSet"
    case ymsesiositemsSet = "YMSESIOSITEMSSet"
    case notificationCollection = "NotificationCollection"
    case ymsesiosapproveSet = "YMSESIOSAPPROVESet"
    case none = ""

    static let all = [
        subscriptionCollection, ymsesiossearhhelpSet, ymsesioscreateSet, ymsesiosviewSet, ymsesiositemsSet, notificationCollection, ymsesiosapproveSet,
    ]
}
