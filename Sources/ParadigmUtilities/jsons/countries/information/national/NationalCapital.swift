//
//  NationalCapital.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalCapital : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, place:String, sources:EventSources
    
    public init(place: String, sources: EventSources) {
        type = .national
        info = .national_capital
        self.place = place
        self.sources = sources
    }
}
