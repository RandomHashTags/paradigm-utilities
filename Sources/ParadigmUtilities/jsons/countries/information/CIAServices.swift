//
//  CIAServices.swift
//  
//
//  Created by Evan Anderson on 10/25/22.
//

public struct CIAServices : SovereignStateInformationValue {    
    public let country_url:String?, summary_url:String?, travel_facts_url:String?
    public var values:[CIAValue]
    public var sources:EventSources?
    
    public init(country_url: String?, summary_url: String?, travel_facts_url: String?, values: [CIAValue], sources: EventSources?) {
        self.country_url = country_url
        self.summary_url = summary_url
        self.travel_facts_url = travel_facts_url
        self.values = values
        self.sources = sources
    }
}
