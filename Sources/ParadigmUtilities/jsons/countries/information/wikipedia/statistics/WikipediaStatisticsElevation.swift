//
//  WikipediaStatisticsElevation.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

public struct WikipediaStatisticsElevation : Jsonable {    
    public var lowest:String?, highest:String?, median:String?
    
    public init(lowest: String?, highest: String?, median: String?) {
        self.lowest = lowest
        self.highest = highest
        self.median = median
    }
}