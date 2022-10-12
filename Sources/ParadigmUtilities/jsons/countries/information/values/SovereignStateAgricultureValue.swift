//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateAgricultureValue : SovereignStateInformationValueProtocol {
    public let worldRank:Int, yearOfData:Int, value:Double
    
    public init(worldRank: Int, yearOfData: Int, value: Double) {
        self.worldRank = worldRank
        self.yearOfData = yearOfData
        self.value = value
    }
}
