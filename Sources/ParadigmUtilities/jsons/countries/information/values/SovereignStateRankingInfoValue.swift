//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValue : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, defcon:Int
    public var worldRank:Int
    public let maxWorldRank:Int, yearOfData:Int, value:Double, isEstimate:Bool
    public let values:[SovereignStateRankingInfoValueOther]?
    
    public init(info: SovereignStateInfo, defcon: Int, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Double, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?) {
        type = .rankings
        self.info = info
        self.defcon = defcon
        self.worldRank = worldRank
        self.maxWorldRank = maxWorldRank
        self.yearOfData = yearOfData
        self.value = value
        self.isEstimate = isEstimate
        self.values = values
    }
}
