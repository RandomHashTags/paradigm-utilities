//
//  CIAServices.swift
//  
//
//  Created by Evan Anderson on 10/25/22.
//

import Foundation

public struct CIAServices : SovereignStateInformationValue {
    public let countryURL:String?, summaryURL:String?, travelFactsURL:String?
    public let values:[CIAValue]
    public let sources:EventSources?
    
    public init(countryURL: String?, summaryURL: String?, travelFactsURL: String?, values: [CIAValue], sources: EventSources?) {
        self.countryURL = countryURL
        self.summaryURL = summaryURL
        self.travelFactsURL = travelFactsURL
        self.values = values
        self.sources = sources
    }
}
