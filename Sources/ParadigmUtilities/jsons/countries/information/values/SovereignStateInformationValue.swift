//
//  SovereignStateInformationValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public protocol SovereignStateInformationValue : Jsonable {
    var type:SovereignStateInformationType { get }
    var info:SovereignStateInfo { get }
}

public struct SovereignStateInformationValueProtocolWrapper : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo
    
    public init(type: SovereignStateInformationType, info: SovereignStateInfo) {
        self.type = type
        self.info = info
    }
}
