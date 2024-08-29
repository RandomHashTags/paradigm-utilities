//
//  SovereignStateWikipedia.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

public struct SovereignStateWikipedia : SovereignStateInformationValue {    
    public var paragraph:String
    public let url:String
    public var statistics:WikipediaStatistics?
    public var sources:EventSources?
    
    public init(paragraph: String, url: String, statistics: WikipediaStatistics?, sources: EventSources?) {
        self.paragraph = paragraph
        self.url = url
        self.statistics = statistics
        self.sources = sources
    }
}