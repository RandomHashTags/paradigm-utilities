//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateRankedValue {
    public let info:SovereignStateInfo, worldRank:Int, maxWorldRank:Int, yearOfData:Int, value:Double, suffix:String, isEstimate:Bool, sources:EventSources?
    
    public init(info: SovereignStateInfo, worldRank: Int, maxWorldRank: Int, yearOfData: Int, value: Double, suffix:String, isEstimate: Bool, sources: EventSources?) {
        self.info = info
        self.worldRank = worldRank
        self.maxWorldRank = maxWorldRank
        self.yearOfData = yearOfData
        self.value = value
        self.suffix = suffix
        self.isEstimate = isEstimate
        self.sources = sources
    }
}
