//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValue : SovereignStateRankedValue {
    public let info:SovereignStateInfo, defcon:Int
    public var worldRank:Int
    public let maxWorldRank:Int, yearOfData:Int, value:Double, suffix:String, isEstimate:Bool
    public let values:[SovereignStateRankingInfoValueOther]?, sources:EventSources?
    
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Int, suffix: String, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, worldRank: worldRank, maxWorldRank: maxWorldRank, yearOfData: yearOfData, value: Double(value), suffix: suffix, isEstimate: isEstimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Double, suffix: String, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.info = info
        self.defcon = defcon
        self.worldRank = worldRank
        self.maxWorldRank = maxWorldRank
        self.yearOfData = yearOfData
        self.value = value
        self.suffix = suffix
        self.isEstimate = isEstimate
        self.values = values
        self.sources = sources
    }
}
