//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInformation : Jsonable {
    public let response_version:Int, values:[SovereignStateInformationValue]
    
    public init(response_version: Int, values: [SovereignStateInformationValue]) {
        self.response_version = response_version
        self.values = values
    }
}
