//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInformation : Jsonable {
    public typealias JSONKeys = SovereignStateInformationValueKeys
    
    public var administration:ClientGovernmentAdministration?
    public var _static:SovereignStateStaticInformation?
    public var nonstatic:SovereignStateNonStaticInformation?
    
    public init(administration: ClientGovernmentAdministration?, _static: SovereignStateStaticInformation?, nonstatic: SovereignStateNonStaticInformation?) {
        self.administration = administration
        self._static = _static
        self.nonstatic = nonstatic
    }
    
    public func getKeyValue(key: SovereignStateInformationValueKeys) -> Any? {
        switch key {
        case .administration: return administration
        case ._static: return _static
        case .nonstatic: return nonstatic
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateInformationValueKeys, value: T) {
        switch key {
        case .administration:
            administration = value as? ClientGovernmentAdministration
            break
        case ._static:
            _static = value as? SovereignStateStaticInformation
            break
        case .nonstatic:
            nonstatic = value as? SovereignStateNonStaticInformation
            break
        }
    }
}

public enum SovereignStateInformationValueKeys : String, JsonableKeys {
    case administration
    case _static
    case nonstatic
}
