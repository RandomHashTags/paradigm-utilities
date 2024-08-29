//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateInformation : Jsonable {    
    public var administration:ClientGovernmentAdministration?
    public var _static:SovereignStateStaticInformation?
    public var nonstatic:SovereignStateNonStaticInformation?
    
    public init(administration: ClientGovernmentAdministration?, _static: SovereignStateStaticInformation?, nonstatic: SovereignStateNonStaticInformation?) {
        self.administration = administration
        self._static = _static
        self.nonstatic = nonstatic
    }
}