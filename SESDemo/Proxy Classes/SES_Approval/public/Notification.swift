// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class Notification: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var id_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "ID")

    private static var collection_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "collection")

    private static var title_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "title")

    private static var updated_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "updated")

    private static var changeType_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "changeType")

    private static var entriesOfInterest_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "entriesOfInterest")

    private static var recipient_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification.property(withName: "recipient")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.notification)
    }

    open class func array(from: EntityValueList) -> Array<Notification> {
        return ArrayConverter.convert(from.toArray(), Array<Notification>())
    }

    open class var changeType: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.changeType_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.changeType_ = value
            }
        }
    }

    open var changeType: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Notification.changeType))
        }
        set(value) {
            self.setOptionalValue(for: Notification.changeType, to: StringValue.of(optional: value))
        }
    }

    open class var collection: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.collection_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.collection_ = value
            }
        }
    }

    open var collection: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Notification.collection))
        }
        set(value) {
            self.setOptionalValue(for: Notification.collection, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> Notification {
        return CastRequired<Notification>.from(self.copyEntity())
    }

    open class var entriesOfInterest: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.entriesOfInterest_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.entriesOfInterest_ = value
            }
        }
    }

    open var entriesOfInterest: Int? {
        get {
            return IntValue.optional(self.optionalValue(for: Notification.entriesOfInterest))
        }
        set(value) {
            self.setOptionalValue(for: Notification.entriesOfInterest, to: IntValue.of(optional: value))
        }
    }

    open class var id: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.id_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.id_ = value
            }
        }
    }

    open var id: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Notification.id))
        }
        set(value) {
            self.setOptionalValue(for: Notification.id, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(id: String?) -> EntityKey {
        return EntityKey().with(name: "ID", value: StringValue.of(optional: id))
    }

    open var old: Notification {
        return CastRequired<Notification>.from(self.oldEntity)
    }

    open class var recipient: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.recipient_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.recipient_ = value
            }
        }
    }

    open var recipient: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Notification.recipient))
        }
        set(value) {
            self.setOptionalValue(for: Notification.recipient, to: StringValue.of(optional: value))
        }
    }

    open class var title: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.title_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.title_ = value
            }
        }
    }

    open var title: String? {
        get {
            return StringValue.optional(self.optionalValue(for: Notification.title))
        }
        set(value) {
            self.setOptionalValue(for: Notification.title, to: StringValue.of(optional: value))
        }
    }

    open class var updated: Property {
        get {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                return Notification.updated_
            }
        }
        set(value) {
            objc_sync_enter(Notification.self)
            defer { objc_sync_exit(Notification.self) }
            do {
                Notification.updated_ = value
            }
        }
    }

    open var updated: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: Notification.updated))
        }
        set(value) {
            self.setOptionalValue(for: Notification.updated, to: value)
        }
    }
}
