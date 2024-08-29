//
//  SovereignStateHistory.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateHistory : SovereignStateInformationValue {    
    public var events:[PreHistoricalEvent], sources:EventSources?
    
    public init(events: [PreHistoricalEvent], sources: EventSources?) {
        self.events = events
        self.sources = sources
    }
}