//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import ZippyJSON

public final class SovereignStateInformation : Jsonable {
    public typealias TranslationKeys = SovereignStateInformationTranslationKeys
    
    public static func == (lhs: SovereignStateInformation, rhs: SovereignStateInformation) -> Bool {
        return lhs.administration == rhs.administration && lhs._static == rhs._static && lhs.nonstatic == rhs.nonstatic
    }
    
    public let administration:ClientGovernmentAdministration?
    
    public var _static:SovereignStateStaticInformation?
    public var nonstatic:SovereignStateNonStaticInformation?
    
    public init(administration: ClientGovernmentAdministration?, _static: SovereignStateStaticInformation?, nonstatic: SovereignStateNonStaticInformation?) {
        self.administration = administration
        self._static = _static
        self.nonstatic = nonstatic
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(administration)
        hasher.combine(_static)
        hasher.combine(nonstatic)
    }
    
    public func getKeyValue(key: SovereignStateInformationTranslationKeys) -> Any? {
        switch key {
        case ._static: return _static
        case .nonstatic: return nonstatic
        }
    }
    public func setKeyValue<T>(key: SovereignStateInformationTranslationKeys, value: T) {
        switch key {
        case ._static:
            _static = value as? SovereignStateStaticInformation
            break
        case .nonstatic:
            nonstatic = value as? SovereignStateNonStaticInformation
            break
        }
    }
}

public enum SovereignStateInformationTranslationKeys : String, JsonableTranslationKey {
    case _static
    case nonstatic
}
