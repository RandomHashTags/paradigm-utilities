//
//  WikipediaStatisticsPopulation.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

public struct WikipediaStatisticsPopulation : Jsonable {    
    public var total:String?, density:String?, median_household_income:String?
    
    public init(total: String?, density: String?, median_household_income: String?) {
        self.total = total
        self.density = density
        self.median_household_income = median_household_income
    }
}