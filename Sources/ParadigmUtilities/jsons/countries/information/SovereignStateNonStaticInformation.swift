//
//  SovereginStateNonStaticInformation.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

public struct SovereignStateNonStaticInformation : SovereignStateInformationValue {    
    public var travel_advisories:[TravelAdvisory]?, sources:EventSources?
    
    public init(travel_advisories: [TravelAdvisory]?, sources: EventSources?) {
        self.travel_advisories = travel_advisories
        self.sources = sources
    }
}