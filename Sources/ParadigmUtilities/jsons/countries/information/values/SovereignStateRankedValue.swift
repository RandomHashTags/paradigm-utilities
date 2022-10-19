//
//  SovereignStateRankedValue.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public protocol SovereignStateRankedValue : SovereignStateInformationValue {
    var info:SovereignStateInfo { get }
    var worldRank:Int { get }
    var maxWorldRank:Int { get }
    var yearOfData:Int { get }
    var value:Double { get }
    var suffix:String { get }
    var isEstimate:Bool { get }
}
