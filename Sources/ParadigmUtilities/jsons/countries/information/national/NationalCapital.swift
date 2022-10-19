//
//  NationalCapital.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalCapital : SovereignStateInformationValue {
    public let place:String, sources:EventSources?
    
    public init(place: String, sources: EventSources?) {
        self.place = place
        self.sources = sources
    }
}
