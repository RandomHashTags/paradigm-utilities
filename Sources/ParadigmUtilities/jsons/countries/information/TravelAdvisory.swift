//
//  TravelAdvisory.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct TravelAdvisory : SovereignStateInformationValue {    
    public let id:String
    public var description:String, sources:EventSources?
    
    public init(id: String, description: String, sources: EventSources?) {
        self.id = id
        self.description = description
        self.sources = sources
    }
}