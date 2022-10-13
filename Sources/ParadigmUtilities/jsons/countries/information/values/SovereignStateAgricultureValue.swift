//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info: SovereignStateInfo, worldRank:Int, yearOfData:Int, value:Double
    
    public init(info: SovereignStateInfo, worldRank: Int, yearOfData: Int, value: Double) {
        type = .agriculture
        self.info = info
        self.worldRank = worldRank
        self.yearOfData = yearOfData
        self.value = value
    }
}
