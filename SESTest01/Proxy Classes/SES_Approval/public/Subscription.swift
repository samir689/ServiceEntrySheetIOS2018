// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class Subscription: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "ID")

    private static var user_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "user")

    private static var updated_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "updated")

    private static var title_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "title")

    private static var deliveryAddress_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "deliveryAddress")

    private static var persistNotifications_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "persistNotifications")

    private static var collection_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "collection")

    private static var filter_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "filter")

    private static var select_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "select")

    private static var changeType_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription.property(withName: "changeType")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.subscription)
    }

    open class func array(from: EntityValueList) -> Array<Subscription> {
        return ArrayConverter.convert(from.toArray(), Array<Subscription>())
    }

    open class var changeType: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.changeType_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.changeType_ = value
            }
        }
    }

    open var changeType: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.changeType))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.changeType, to: StringValue.of(optional: value))
        }
    }

    open class var collection: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.collection_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.collection_ = value
            }
        }
    }

    open var collection: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.collection))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.collection, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Subscription {
        return CastRequired<Subscription>.from(self.copyEntity())
    }

    open class var deliveryAddress: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.deliveryAddress_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.deliveryAddress_ = value
            }
        }
    }

    open var deliveryAddress: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.deliveryAddress))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.deliveryAddress, to: StringValue.of(optional: value))
        }
    }

    open class var filter: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.filter_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.filter_ = value
            }
        }
    }

    open var filter: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.filter))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.filter, to: StringValue.of(optional: value))
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.id_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.id))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.id, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "ID", value: StringValue.of(optional: id))
    }

    open var old: Subscription {
        return CastRequired<Subscription>.from(self.oldEntity)
    }

    open class var persistNotifications: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.persistNotifications_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.persistNotifications_ = value
            }
        }
    }

    open var persistNotifications: Bool? {
        get {
            return BooleanValue.optional(self.optionalValue(for: Subscription.persistNotifications))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.persistNotifications, to: BooleanValue.of(optional: value))
        }
    }

    open class var select: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.select_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.select_ = value
            }
        }
    }

    open var select: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.select))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.select, to: StringValue.of(optional: value))
        }
    }

    open class var title: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.title_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.title_ = value
            }
        }
    }

    open var title: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.title))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.title, to: StringValue.of(optional: value))
        }
    }

    open class var updated: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.updated_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.updated_ = value
            }
        }
    }

    open var updated: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Subscription.updated))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.updated, to: value)
        }
    }

    open class var user: Property {
        get {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                return Subscription.user_
            }
        }
        set(value) {
            objc_sync_enter(Subscription.self)
            defer { objc_sync_exit(Subscription.self) }
            do {
                Subscription.user_ = value
            }
        }
    }

    open var user: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Subscription.user))
        }
        set(value) {
            self.setOptionalValue(for: Subscription.user, to: StringValue.of(optional: value))
        }
    }
}
