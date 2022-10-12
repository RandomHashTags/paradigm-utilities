//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateRankingInfoValue : SovereignStateInformationValueProtocol {
    public let defcon:Int
    public var worldRank:Int
    public let yearOfData:Int, value:Double, isEstimate:Bool
    public let values:[SovereignStateRankingInfoValueOther]?
    
    public init(defcon: Int, worldRank: Int, yearOfData: Int, value: Double, isEstimate: Bool, values: [SovereignStateRankingInfoValueOther]?) {
        self.defcon = defcon
        self.worldRank = worldRank
        self.yearOfData = yearOfData
        self.value = value
        self.isEstimate = isEstimate
        self.values = values
    }
}
