// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class YmSesIosCreate: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var sheetNo_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "SheetNo")

    private static var personInt_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "PersonInt")

    private static var shortText_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "ShortText")

    private static var poNumber_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "PoNumber")

    private static var poItem_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "PoItem")

    private static var note_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate.property(withName: "Note")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosCreate)
    }

    open class func array(from: EntityValueList) -> Array<YmSesIosCreate> {
        return ArrayConverter.convert(from.toArray(), Array<YmSesIosCreate>())
    }

    open func copy() -> YmSesIosCreate {
        return CastRequired<YmSesIosCreate>.from(self.copyEntity())
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(sheetNo: String?) -> EntityKey {
        return EntityKey().with(name: "SheetNo", value: StringValue.of(optional: sheetNo))
    }

    open class var note: Property {
        get {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                return YmSesIosCreate.note_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                YmSesIosCreate.note_ = value
            }
        }
    }

    open var note: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosCreate.note))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosCreate.note, to: StringValue.of(optional: value))
        }
    }

    open var old: YmSesIosCreate {
        return CastRequired<YmSesIosCreate>.from(self.oldEntity)
    }

    open class var personInt: Property {
        get {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                return YmSesIosCreate.personInt_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                YmSesIosCreate.personInt_ = value
            }
        }
    }

    open var personInt: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosCreate.personInt))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosCreate.personInt, to: StringValue.of(optional: value))
        }
    }

    open class var poItem: Property {
        get {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                return YmSesIosCreate.poItem_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                YmSesIosCreate.poItem_ = value
            }
        }
    }

    open var poItem: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosCreate.poItem))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosCreate.poItem, to: StringValue.of(optional: value))
        }
    }

    open class var poNumber: Property {
        get {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                return YmSesIosCreate.poNumber_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                YmSesIosCreate.poNumber_ = value
            }
        }
    }

    open var poNumber: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosCreate.poNumber))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosCreate.poNumber, to: StringValue.of(optional: value))
        }
    }

    open class var sheetNo: Property {
        get {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                return YmSesIosCreate.sheetNo_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                YmSesIosCreate.sheetNo_ = value
            }
        }
    }

    open var sheetNo: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosCreate.sheetNo))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosCreate.sheetNo, to: StringValue.of(optional: value))
        }
    }

    open class var shortText: Property {
        get {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                return YmSesIosCreate.shortText_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosCreate.self)
            defer { objc_sync_exit(YmSesIosCreate.self) }
            do {
                YmSesIosCreate.shortText_ = value
            }
        }
    }

    open var shortText: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosCreate.shortText))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosCreate.shortText, to: StringValue.of(optional: value))
        }
    }
}
