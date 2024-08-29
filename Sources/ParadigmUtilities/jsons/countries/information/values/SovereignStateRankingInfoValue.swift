//
//  SovereignStateRankingInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateRankingInfoValue : SovereignStateRankedValue {    
    public let info:SovereignStateInfo, defcon:Int
    public var world_rank:Int, world_rank_max:Int
    public let year_of_data:Int, value:RoundedFloat
    public var suffix:String?
    public let is_estimate:Bool
    public var values:[SovereignStateRankingInfoValueOther]?, sources:EventSources?
    
    public init(info: SovereignStateInfo, defcon: Int, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: Int, suffix: String?, is_estimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, world_rank: world_rank, world_rank_max: world_rank_max, year_of_data: year_of_data, value: RoundedFloat(value), suffix: suffix, is_estimate: is_estimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: Int64, suffix: String?, is_estimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.init(info: info, defcon: defcon, world_rank: world_rank, world_rank_max: world_rank_max, year_of_data: year_of_data, value: RoundedFloat(value), suffix: suffix, is_estimate: is_estimate, values: values, sources: sources)
    }
    public init(info: SovereignStateInfo, defcon: Int, world_rank: Int, world_rank_max: Int, year_of_data: Int, value: RoundedFloat, suffix: String?, is_estimate: Bool, values: [SovereignStateRankingInfoValueOther]?, sources: EventSources?) {
        self.info = info
        self.defcon = defcon
        self.world_rank = world_rank
        self.world_rank_max = world_rank_max
        self.year_of_data = year_of_data
        self.value = value
        self.suffix = suffix
        self.is_estimate = is_estimate
        self.values = values
        self.sources = sources
    }
}