//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValueOther : Jsonable {
    public let value:Double?, valueType:NumberType, description:String, suffix:String?
    
    public init(value: Int?, description: String, suffix: String?) {
        self.init(value: value != nil ? Double(value!) : nil, valueType: .integer, description: description, suffix: suffix)
    }
    public init(value: Float?, description: String, suffix: String?) {
        self.init(value: value != nil ? Double(value!) : nil, valueType: .float, description: description, suffix: suffix)
    }
    public init(value: Double?, valueType: NumberType = .double, description: String, suffix: String?) {
        self.value = value
        self.valueType = valueType
        self.description = description
        self.suffix = suffix
    }
}
