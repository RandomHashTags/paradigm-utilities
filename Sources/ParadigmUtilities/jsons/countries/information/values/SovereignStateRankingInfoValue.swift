//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValue : SovereignStateRankedValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, defcon:Int
    public let worldRank:Int, maxWorldRank:Int, yearOfData:Int, value:Double, suffix:String, isEstimate:Bool
    public let values:[SovereignStateRankingInfoValueOther]?, sources:EventSources?
    
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Double, suffix: String, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        type = .rankings
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
