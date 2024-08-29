//
//  NationalAnthem.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct NationalAnthem : SovereignStateInformationValue {    
    public let mp3_url:String
    public var sources:EventSources?
    
    public init(mp3_url: String, sources: EventSources?) {
        self.mp3_url = mp3_url
        self.sources = sources
    }
}