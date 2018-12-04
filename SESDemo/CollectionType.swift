//
// CollectionType.swift
// SESDemo
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/12/18
//

import Foundation

enum CollectionType: String {
    case ymsesioscreateSet = "YMSESIOSCREATESet"
    case ymsesiossearhhelpSet = "YMSESIOSSEARHHELPSet"
    case ymsesiosviewSet = "YMSESIOSVIEWSet"
    case ymsesiositemsSet = "YMSESIOSITEMSSet"
    case notificationCollection = "NotificationCollection"
    case subscriptionCollection = "SubscriptionCollection"
    case ymsesiosapproveSet = "YMSESIOSAPPROVESet"
    case none = ""

    static let all = [
        ymsesioscreateSet, ymsesiossearhhelpSet, ymsesiosviewSet, ymsesiositemsSet, notificationCollection, subscriptionCollection, ymsesiosapproveSet,
    ]
}
