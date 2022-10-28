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
    public typealias OmittableKeys = SovereignStateInformationOmittableKeys
    
    public static func == (lhs: SovereignStateInformation, rhs: SovereignStateInformation) -> Bool {
        return lhs.administration == rhs.administration && lhs._static == rhs._static && lhs.nonstatic == rhs.nonstatic
    }
    
    @CodableOmittable public var administration:ClientGovernmentAdministration?
    @CodableOmittable public var _static:SovereignStateStaticInformation?
    public var nonstatic:SovereignStateNonStaticInformation?
    
    public init(administration: ClientGovernmentAdministration?, _static: SovereignStateStaticInformation?, nonstatic: SovereignStateNonStaticInformation?) {
        self._administration = CodableOmittable(administration)
        self.__static = CodableOmittable(_static)
        self.nonstatic = nonstatic
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(administration)
        hasher.combine(_static)
        hasher.combine(nonstatic)
    }
    
    public func getTranslationKeyValue(key: SovereignStateInformationTranslationKeys) -> Any? {
        switch key {
        case ._static: return _static
        case .nonstatic: return nonstatic
        }
    }
    public func setTranslationKeyValue<T>(key: SovereignStateInformationTranslationKeys, value: T) {
        switch key {
        case ._static:
            __static = CodableOmittable(value as? SovereignStateStaticInformation)
            break
        case .nonstatic:
            nonstatic = value as? SovereignStateNonStaticInformation
            break
        }
    }
    
    public func getOmittableKeyValue(key: SovereignStateInformationOmittableKeys) -> (any CodableOmittableProtocol)? {
        switch key {
        case .administration: return _administration
        case ._static: return __static
        }
    }
    public func setOmittableKeyValue<T: CodableOmittableProtocol>(key: SovereignStateInformationOmittableKeys, value: T) {
        switch key {
        case .administration:
            _administration = value as! CodableOmittable<ClientGovernmentAdministration>
            break
        case ._static:
            __static = value as! CodableOmittable<SovereignStateStaticInformation>
            break
        }
    }
}

public enum SovereignStateInformationTranslationKeys : String, JsonableTranslationKey {
    case _static
    case nonstatic
}
public enum SovereignStateInformationOmittableKeys : String, JsonableOmittableKey {
    case administration
    case _static
}
