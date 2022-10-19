//
//  SovereignStateHistory.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateHistory : SovereignStateInformationValue {
    public let summaryEvents:[HistoricalEvent], sources:EventSources?
    
    public init(summaryEvents: [HistoricalEvent], sources: EventSources?) {
        self.summaryEvents = summaryEvents
        self.sources = sources
    }
}
