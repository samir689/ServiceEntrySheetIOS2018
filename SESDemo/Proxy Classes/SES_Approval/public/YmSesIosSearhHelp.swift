// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

open class YmSesIosSearhHelp: EntityValue {
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    private static var ebeln_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp.property(withName: "Ebeln")

    private static var ebelp_: Property = YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp.property(withName: "Ebelp")

    public init(withDefaults: Bool = true) {
        super.init(withDefaults: withDefaults, type: YMSESAPPROVALSRVEntitiesMetadata.EntityTypes.ymSesIosSearhHelp)
    }

    open class func array(from: EntityValueList) -> Array<YmSesIosSearhHelp> {
        return ArrayConverter.convert(from.toArray(), Array<YmSesIosSearhHelp>())
    }

    open func copy() -> YmSesIosSearhHelp {
        return CastRequired<YmSesIosSearhHelp>.from(self.copyEntity())
    }

    open class var ebeln: Property {
        get {
            objc_sync_enter(YmSesIosSearhHelp.self)
            defer { objc_sync_exit(YmSesIosSearhHelp.self) }
            do {
                return YmSesIosSearhHelp.ebeln_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosSearhHelp.self)
            defer { objc_sync_exit(YmSesIosSearhHelp.self) }
            do {
                YmSesIosSearhHelp.ebeln_ = value
            }
        }
    }

    open var ebeln: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosSearhHelp.ebeln))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosSearhHelp.ebeln, to: StringValue.of(optional: value))
        }
    }

    open class var ebelp: Property {
        get {
            objc_sync_enter(YmSesIosSearhHelp.self)
            defer { objc_sync_exit(YmSesIosSearhHelp.self) }
            do {
                return YmSesIosSearhHelp.ebelp_
            }
        }
        set(value) {
            objc_sync_enter(YmSesIosSearhHelp.self)
            defer { objc_sync_exit(YmSesIosSearhHelp.self) }
            do {
                YmSesIosSearhHelp.ebelp_ = value
            }
        }
    }

    open var ebelp: String? {
        get {
            return StringValue.optional(self.optionalValue(for: YmSesIosSearhHelp.ebelp))
        }
        set(value) {
            self.setOptionalValue(for: YmSesIosSearhHelp.ebelp, to: StringValue.of(optional: value))
        }
    }

    open override var isProxy: Bool {
        return true
    }

    open class func key(ebeln: String?) -> EntityKey {
        return EntityKey().with(name: "Ebeln", value: StringValue.of(optional: ebeln))
    }

    open var old: YmSesIosSearhHelp {
        return CastRequired<YmSesIosSearhHelp>.from(self.oldEntity)
    }
}
