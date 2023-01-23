//
//  SovereignStateRankedValue.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public protocol SovereignStateRankedValue : SovereignStateIdentifiableValue {
    var world_rank:Int { get }
    var world_rank_max:Int { get }
    var value:Double { get }
    var suffix:String? { get }
    var is_estimate:Bool { get }
}
