//
//  SovereignStateRankedValue.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

public protocol SovereignStateRankedValue : SovereignStateIdentifiableValue {
    var world_rank:Int { get }
    var world_rank_max:Int { get set }
    var value:RoundedFloat { get }
    var suffix:String? { get }
    var is_estimate:Bool { get }
}
