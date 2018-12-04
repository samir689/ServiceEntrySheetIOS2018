// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class YmSesIosApprove: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var lblni_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lblni")

    private static var sesTxz01_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "SesTxz01")

    private static var sbnamag_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Sbnamag")

    private static var ernam_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Ernam")

    private static var lwert_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lwert")

    private static var lbldt_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lbldt")

    private static var bsart_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Bsart")

    private static var lifnr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Lifnr")

    private static var ebeln_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Ebeln")

    private static var ebelp_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Ebelp")

    private static var poTxzo1_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "PoTxzo1")

    private static var netpr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Netpr")

    private static var wiID_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "WiId")

    private static var appFlag_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "AppFlag")

    private static var eindt_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "Eindt")

    private static var netCurr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "NetCurr")

    private static var poCurr_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "PoCurr")

    private static var headToItems_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "HeadToItems")

    private static var ymSESIOSITEMSSet_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove.property(withName: "YM_SES_IOS_ITEMSSet")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosApprove)
    }

    open class var appFlag: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.appFlag_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.appFlag_ = value
            }
        }
    }

    open var appFlag: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.appFlag))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.appFlag, to: StringValue.of(optional: value))
        }
    }

    open class func array(from: EntityValueList) -> Array<YmSesIosApprove> {
        return ArrayConverter.convert(from.toArray(), Array<YmSesIosApprove>())
    }

    open class var bsart: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.bsart_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.bsart_ = value
            }
        }
    }

    open var bsart: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.bsart))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.bsart, to: StringValue.of(optional: value))
        }
    }

    open func copy() -> YmSesIosApprove {
        return CastRequired<YmSesIosApprove>.from(self.copyEntity())
    }

    open class var ebeln: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.ebeln_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.ebeln_ = value
            }
        }
    }

    open var ebeln: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.ebeln))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.ebeln, to: StringValue.of(optional: value))
        }
    }

    open class var ebelp: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.ebelp_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.ebelp_ = value
            }
        }
    }

    open var ebelp: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.ebelp))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.ebelp, to: StringValue.of(optional: value))
        }
    }

    open class var eindt: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.eindt_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.eindt_ = value
            }
        }
    }

    open var eindt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: YmSesIosApprove.eindt))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.eindt, to: value)
        }
    }

    open class var ernam: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.ernam_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.ernam_ = value
            }
        }
    }

    open var ernam: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.ernam))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.ernam, to: StringValue.of(optional: value))
        }
    }

    open class var headToItems: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.headToItems_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.headToItems_ = value
            }
        }
    }

    open var headToItems: Array<YmSesIosItems> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: YmSesIosApprove.headToItems)).toArray(), Array<YmSesIosItems>())
        }
        set(value) {
            YmSesIosApprove.headToItems.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
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
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.lbldt_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.lbldt_ = value
            }
        }
    }

    open var lbldt: LocalDateTime? {
        get {
            return LocalDateTime.castOptional(self.optionalValue(for: YmSesIosApprove.lbldt))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.lbldt, to: value)
        }
    }

    open class var lblni: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.lblni_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.lblni_ = value
            }
        }
    }

    open var lblni: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.lblni))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.lblni, to: StringValue.of(optional: value))
        }
    }

    open class var lifnr: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.lifnr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.lifnr_ = value
            }
        }
    }

    open var lifnr: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.lifnr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.lifnr, to: StringValue.of(optional: value))
        }
    }

    open class var lwert: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.lwert_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.lwert_ = value
            }
        }
    }

    open var lwert: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosApprove.lwert))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.lwert, to: DecimalValue.of(optional: value))
        }
    }

    open class var netCurr: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.netCurr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.netCurr_ = value
            }
        }
    }

    open var netCurr: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.netCurr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.netCurr, to: StringValue.of(optional: value))
        }
    }

    open class var netpr: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.netpr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.netpr_ = value
            }
        }
    }

    open var netpr: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: YmSesIosApprove.netpr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.netpr, to: DecimalValue.of(optional: value))
        }
    }

    open var old: YmSesIosApprove {
        return CastRequired<YmSesIosApprove>.from(self.oldEntity)
    }

    open class var poCurr: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.poCurr_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.poCurr_ = value
            }
        }
    }

    open var poCurr: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.poCurr))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.poCurr, to: StringValue.of(optional: value))
        }
    }

    open class var poTxzo1: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.poTxzo1_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.poTxzo1_ = value
            }
        }
    }

    open var poTxzo1: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.poTxzo1))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.poTxzo1, to: StringValue.of(optional: value))
        }
    }

    open class var sbnamag: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.sbnamag_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.sbnamag_ = value
            }
        }
    }

    open var sbnamag: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.sbnamag))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.sbnamag, to: StringValue.of(optional: value))
        }
    }

    open class var sesTxz01: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.sesTxz01_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.sesTxz01_ = value
            }
        }
    }

    open var sesTxz01: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.sesTxz01))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.sesTxz01, to: StringValue.of(optional: value))
        }
    }

    open class var wiID: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.wiID_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.wiID_ = value
            }
        }
    }

    open var wiID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosApprove.wiID))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosApprove.wiID, to: StringValue.of(optional: value))
        }
    }

    open class var ymSESIOSITEMSSet: Property {
        get {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                return YmSesIosApprove.ymSESIOSITEMSSet_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosApprove.self)
            defer { objc_sync_exit(YmSesIosApprove.self) }
            do {
                YmSesIosApprove.ymSESIOSITEMSSet_ = value
            }
        }
    }

    open var ymSESIOSITEMSSet: Array<YmSesIosItems> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: YmSesIosApprove.ymSESIOSITEMSSet)).toArray(), Array<YmSesIosItems>())
        }
        set(value) {
            YmSesIosApprove.ymSESIOSITEMSSet.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }
}
