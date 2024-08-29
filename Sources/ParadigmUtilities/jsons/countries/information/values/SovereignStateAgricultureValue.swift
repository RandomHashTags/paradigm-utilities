//
//  SovereignStateAgricultureValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateAgricultureValue : SovereignStateRankedValue {    
    public let info:SovereignStateInfo, world_rank:Int
    public var world_rank_max:Int
    public let year_of_data:Int, value:RoundedFloat
    public var suffix:String?
    public let is_estimate:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: Int, suffix: String?, is_estimate: Bool, sources: EventSources?) {
        self.info = info
        self.world_rank = world_rank
        self.world_rank_max = world_rank_max
        self.year_of_data = year_of_data
        self.value = RoundedFloat(value)
        self.suffix = suffix
        self.is_estimate = is_estimate
        self.sources = sources
    }
}