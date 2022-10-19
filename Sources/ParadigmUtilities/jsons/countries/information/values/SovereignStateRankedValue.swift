//
//  SovereignStateRankedValue.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public protocol SovereignStateRankedValue : SovereignStateIdentifiableValue {
    var worldRank:Int { get }
    var maxWorldRank:Int { get }
    var value:Double { get }
    var suffix:String { get }
    var isEstimate:Bool { get }
}
