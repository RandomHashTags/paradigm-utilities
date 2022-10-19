//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import ZippyJSON

public final class SovereignStateInformation : Jsonable {
    public static func == (lhs: SovereignStateInformation, rhs: SovereignStateInformation) -> Bool {
        return lhs.response_version == rhs.response_version && lhs.administration == rhs.administration && lhs._static == rhs._static && lhs.nonstatic == rhs.nonstatic
    }
    
    public let response_version:Int
    public let administration:ClientGovernmentAdministration?
    
    public let _static:SovereignStateStaticInformation?
    public let nonstatic:SovereignStateNonStaticInformation?
    
    public init(response_version: Int, administration: ClientGovernmentAdministration?, _static: SovereignStateStaticInformation?, nonstatic: SovereignStateNonStaticInformation?) {
        self.response_version = response_version
        self.administration = administration
        self._static = _static
        self.nonstatic = nonstatic
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(response_version)
        hasher.combine(administration)
        hasher.combine(_static)
        hasher.combine(nonstatic)
    }
}
