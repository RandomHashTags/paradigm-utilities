//
//  SovereginStateNonStaticInformation.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateNonStaticInformation : SovereignStateInformationValue {
    public let travelAdvisories:[TravelAdvisory]?, sources:EventSources?
    
    public init(travelAdvisories: [TravelAdvisory]?, sources: EventSources?) {
        self.travelAdvisories = travelAdvisories
        self.sources = sources
    }
}
