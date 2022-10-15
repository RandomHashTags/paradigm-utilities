//
//  SovereignStateHistory.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateHistory : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo
    public let summaryEvents:[HistoricalEvent], sources:EventSources?
    
    public init(summaryEvents: [HistoricalEvent], sources: EventSources?) {
        type = .history
        info = .service_sovereign_state_history
        self.summaryEvents = summaryEvents
        self.sources = sources
    }
}
