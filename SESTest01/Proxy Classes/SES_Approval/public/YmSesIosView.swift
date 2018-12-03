// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class YmSesIosView: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var sesTxz01_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "SesTxz01")

    private static var lblni_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lblni")

    private static var sbnamag_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Sbnamag")

    private static var ernam_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Ernam")

    private static var lwert_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lwert")

    private static var lbldt_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lbldt")

    private static var bsart_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Bsart")

    private static var lifnr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Lifnr")

    private static var ebeln_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Ebeln")

    private static var ebelp_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Ebelp")

    private static var poTxzo1_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "PoTxzo1")

    private static var netpr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Netpr")

    private static var wiID_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "WiId")

    private static var eindt_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "Eindt")

    private static var netCurr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "NetCurr")

    private static var poCurr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "PoCurr")

    private static var viewheadToItems_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView.property(withName: "ViewheadToItems")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosView)
    }

    open class func array(from: EntityValueList) -> Array<YmSesIosView> {
        return ArrayConverter.convert(from.toArray(), Array<YmSesIosView>())
    }

    open class var bsart: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.bsart_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.bsart_ = value
            }
        }
    }

    open var bsart: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.bsart))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.bsart, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> YmSesIosView {
        return CastRequired<YmSesIosView>.from(self.copyEntity())
    }

    open class var ebeln: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.ebeln_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.ebeln_ = value
            }
        }
    }

    open var ebeln: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.ebeln))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.ebeln, to: StringValue.of(optional: value))
        }
    }

    open class var ebelp: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.ebelp_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.ebelp_ = value
            }
        }
    }

    open var ebelp: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.ebelp))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.ebelp, to: StringValue.of(optional: value))
        }
    }

    open class var eindt: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.eindt_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.eindt_ = value
            }
        }
    }

    open var eindt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: YmSesIosView.eindt))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.eindt, to: value)
        }
    }

    open class var ernam: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.ernam_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.ernam_ = value
            }
        }
    }

    open var ernam: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.ernam))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.ernam, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(lblni: String?) -> EntityKey {
        return EntityKey().with(name: "Lblni", value: StringValue.of(optional: lblni))
    }

    open class var lbldt: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.lbldt_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.lbldt_ = value
            }
        }
    }

    open var lbldt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: YmSesIosView.lbldt))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.lbldt, to: value)
        }
    }

    open class var lblni: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.lblni_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.lblni_ = value
            }
        }
    }

    open var lblni: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.lblni))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.lblni, to: StringValue.of(optional: value))
        }
    }

    open class var lifnr: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.lifnr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.lifnr_ = value
            }
        }
    }

    open var lifnr: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.lifnr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.lifnr, to: StringValue.of(optional: value))
        }
    }

    open class var lwert: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.lwert_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.lwert_ = value
            }
        }
    }

    open var lwert: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosView.lwert))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.lwert, to: DecimalValue.of(optional: value))
        }
    }

    open class var netCurr: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.netCurr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.netCurr_ = value
            }
        }
    }

    open var netCurr: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.netCurr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.netCurr, to: StringValue.of(optional: value))
        }
    }

    open class var netpr: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.netpr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.netpr_ = value
            }
        }
    }

    open var netpr: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosView.netpr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.netpr, to: DecimalValue.of(optional: value))
        }
    }

    open var old: YmSesIosView {
        return CastRequired<YmSesIosView>.from(self.oldEntity)
    }

    open class var poCurr: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.poCurr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.poCurr_ = value
            }
        }
    }

    open var poCurr: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.poCurr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.poCurr, to: StringValue.of(optional: value))
        }
    }

    open class var poTxzo1: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.poTxzo1_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.poTxzo1_ = value
            }
        }
    }

    open var poTxzo1: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.poTxzo1))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.poTxzo1, to: StringValue.of(optional: value))
        }
    }

    open class var sbnamag: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.sbnamag_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.sbnamag_ = value
            }
        }
    }

    open var sbnamag: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.sbnamag))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.sbnamag, to: StringValue.of(optional: value))
        }
    }

    open class var sesTxz01: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.sesTxz01_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.sesTxz01_ = value
            }
        }
    }

    open var sesTxz01: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.sesTxz01))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.sesTxz01, to: StringValue.of(optional: value))
        }
    }

    open class var viewheadToItems: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.viewheadToItems_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.viewheadToItems_ = value
            }
        }
    }

    open var viewheadToItems: Array<YmSesIosItems> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: YmSesIosView.viewheadToItems)).toArray(), Array<YmSesIosItems>())
        }
        set(value) {
            YmSesIosView.viewheadToItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class var wiID: Property {
        get {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                return YmSesIosView.wiID_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosView.self)
            defer { objc_sync_exit(YmSesIosView.self) }
            do {
                YmSesIosView.wiID_ = value
            }
        }
    }

    open var wiID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosView.wiID))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosView.wiID, to: StringValue.of(optional: value))
        }
    }
}
