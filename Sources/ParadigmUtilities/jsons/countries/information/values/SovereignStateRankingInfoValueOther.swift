//
//  SovereignStateRankingInfoValueOther.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateRankingInfoValueOther : Jsonable {    
    public let value:RoundedFloat?
    public var description:String, suffix:String?
    
    public init(value: Int?, description: String, suffix: String?) {
        self.init(value: value != nil ? RoundedFloat(value!) : nil, description: description, suffix: suffix)
    }
    public init(value: RoundedFloat?, description: String, suffix: String?) {
        self.value = value
        self.description = description
        self.suffix = suffix
    }
}