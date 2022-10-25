//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateRankedValue {
    public let info:SovereignStateInfo, worldRank:Int
    public var maxWorldRank:Int
    public let yearOfData:Int, value:Double, valueType:NumberType, suffix:String?, isEstimate:Bool, sources:EventSources?
    
    public init(info: SovereignStateInfo, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int, suffix: String?, isEstimate: Bool, sources: EventSources?) {
        self.info = info
        self.worldRank = worldRank
        self.maxWorldRank = maxWorldRank
        self.yearOfData = yearOfData
        self.value = Double(value)
        self.valueType = NumberType.integer
        self.suffix = suffix
        self.isEstimate = isEstimate
        self.sources = sources
    }
}
