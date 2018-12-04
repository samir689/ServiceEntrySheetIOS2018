// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class YmSesIosItems: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var extrow_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Extrow")

    private static var ebeln_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Ebeln")

    private static var menge_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Menge")

    private static var tbtwr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Tbtwr")

    private static var waers_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Waers")

    private static var netwr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Netwr")

    private static var ktext1_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Ktext1")

    private static var packno_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Packno")

    private static var introw_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems.property(withName: "Introw")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosItems)
    }

    open class func array(from: EntityValueList) -> Array<YmSesIosItems> {
        return ArrayConverter.convert(from.toArray(), Array<YmSesIosItems>())
    }

    open func copy() -> YmSesIosItems {
        return CastRequired<YmSesIosItems>.from(self.copyEntity())
    }

    open class var ebeln: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.ebeln_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.ebeln_ = value
            }
        }
    }

    open var ebeln: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosItems.ebeln))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.ebeln, to: StringValue.of(optional: value))
        }
    }

    open class var extrow: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.extrow_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.extrow_ = value
            }
        }
    }

    open var extrow: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosItems.extrow))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.extrow, to: StringValue.of(optional: value))
        }
    }

    open class var introw: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.introw_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.introw_ = value
            }
        }
    }

    open var introw: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosItems.introw))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.introw, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(packno: String?, introw: String?) -> EntityKey {
        return EntityKey().with(name: "Packno", value: StringValue.of(optional: packno)).with(name: "Introw", value: StringValue.of(optional: introw))
    }

    open class var ktext1: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.ktext1_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.ktext1_ = value
            }
        }
    }

    open var ktext1: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosItems.ktext1))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.ktext1, to: StringValue.of(optional: value))
        }
    }

    open class var menge: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.menge_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.menge_ = value
            }
        }
    }

    open var menge: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosItems.menge))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.menge, to: DecimalValue.of(optional: value))
        }
    }

    open class var netwr: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.netwr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.netwr_ = value
            }
        }
    }

    open var netwr: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosItems.netwr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.netwr, to: DecimalValue.of(optional: value))
        }
    }

    open var old: YmSesIosItems {
        return CastRequired<YmSesIosItems>.from(self.oldEntity)
    }

    open class var packno: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.packno_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.packno_ = value
            }
        }
    }

    open var packno: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosItems.packno))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.packno, to: StringValue.of(optional: value))
        }
    }

    open class var tbtwr: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.tbtwr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.tbtwr_ = value
            }
        }
    }

    open var tbtwr: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosItems.tbtwr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.tbtwr, to: DecimalValue.of(optional: value))
        }
    }

    open class var waers: Property {
        get {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                return YmSesIosItems.waers_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosItems.self)
            defer { objc_sync_exit(YmSesIosItems.self) }
            do {
                YmSesIosItems.waers_ = value
            }
        }
    }

    open var waers: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosItems.waers))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosItems.waers, to: StringValue.of(optional: value))
        }
    }
}
