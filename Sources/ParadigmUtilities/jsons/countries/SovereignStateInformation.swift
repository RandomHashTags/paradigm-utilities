//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import ZippyJSON

public struct SovereignStateInformation : Jsonable {
    public typealias ValueKeys = SovereignStateInformationValueKeys
    
    @CodableOmittable public var administration:ClientGovernmentAdministration?
    @CodableOmittable public var _static:SovereignStateStaticInformation?
    public var nonstatic:SovereignStateNonStaticInformation?
    
    public init(administration: ClientGovernmentAdministration?, _static: SovereignStateStaticInformation?, nonstatic: SovereignStateNonStaticInformation?) {
        self._administration = CodableOmittable(administration)
        self.__static = CodableOmittable(_static)
        self.nonstatic = nonstatic
    }
    
    public func getKeyValue(key: SovereignStateInformationValueKeys) -> Any? {
        switch key {
        case .administration: return _administration
        case ._static: return __static
        case .nonstatic: return nonstatic
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateInformationValueKeys, value: T) {
        switch key {
        case .administration:
            _administration = value as! CodableOmittable<ClientGovernmentAdministration>
            break
        case ._static:
            __static = value as! CodableOmittable<SovereignStateStaticInformation>
            break
        case .nonstatic:
            nonstatic = value as? SovereignStateNonStaticInformation
            break
        }
    }
}

public enum SovereignStateInformationValueKeys : String, JsonableValueKeys {
    case administration
    case _static
    case nonstatic
    
    public func isTranslatable() -> Bool {
        switch self {
        case ._static, .nonstatic:
            return true
        default:
            return false
        }
    }
    public func isOmittable() -> Bool {
        switch self {
        case .administration, ._static:
            return true
        default:
            return false
        }
    }
}
