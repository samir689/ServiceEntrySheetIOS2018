// # Proxy Compiler 18.9.3-e21ac4-20181026

import Foundation
import SAPOData

internal class YMSESAPPROVALSRVEntitiesMetadataParser {
    internal static let options: Int = (CSDLOption.allowCaseConflicts | CSDLOption.disableFacetWarnings | CSDLOption.disableNameValidation | CSDLOption.processMixedVersions | CSDLOption.retainOriginalText | CSDLOption.ignoreUndefinedTerms)

    internal static let parsed: CSDLDocument = YMSESAPPROVALSRVEntitiesMetadataParser.parse()

    static func parse() -> CSDLDocument {
        let parser: CSDLParser = CSDLParser()
        parser.logWarnings = false
        parser.csdlOptions = YMSESAPPROVALSRVEntitiesMetadataParser.options
        let metadata: CSDLDocument = parser.parseInProxy(YMSESAPPROVALSRVEntitiesMetadataText.xml, url: "YM_SES_APPROVAL_SRV")
        metadata.proxyVersion = "18.9.3-e21ac4-20181026"
        return metadata
    }
}
