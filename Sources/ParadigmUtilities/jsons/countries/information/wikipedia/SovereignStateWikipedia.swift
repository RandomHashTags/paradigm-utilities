//
//  SovereignStateWikipedia.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SovereignStateWikipedia : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, paragraph:String, url:String, statistics:WikipediaStatistics?, sources:EventSources?
    
    public init(paragraph: String, url: String, statistics: WikipediaStatistics?, sources: EventSources?) {
        type = .services_static
        info = .service_wikipedia
        self.paragraph = paragraph
        self.url = url
        self.statistics = statistics
        self.sources = sources
    }
}
