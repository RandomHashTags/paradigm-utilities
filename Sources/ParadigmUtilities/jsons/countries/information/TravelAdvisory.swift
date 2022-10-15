//
//  TravelAdvisory.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct TravelAdvisory : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, id:String, description:String, sources:EventSources?
    
    public init(id: String, description: String, sources: EventSources?) {
        type = .services_nonstatic
        info = .service_travel_advisories
        self.id = id
        self.description = description
        self.sources = sources
    }
}
