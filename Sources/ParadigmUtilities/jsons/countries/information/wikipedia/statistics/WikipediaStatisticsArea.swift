//
//  WikipediaStatisticsArea.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

public struct WikipediaStatisticsArea : Jsonable {    
    public var total:String?, water:String?, land:String?
    
    public init(total: String?, water: String?, land: String?) {
        self.total = total
        self.water = water
        self.land = land
    }
}