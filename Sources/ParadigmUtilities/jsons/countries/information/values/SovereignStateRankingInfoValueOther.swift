//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public let value:Double?, valueType:NumberType, description:String, suffix:String?
    
    public init(value: Double?, valueType: NumberType, description: String, suffix: String?) {
        self.value = value
        self.valueType = valueType
        self.description = description
        self.suffix = suffix
    }
}
