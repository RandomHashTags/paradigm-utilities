//
//  NationalAnthem.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnthem : SovereignStateInformationValue {
    public let mp3URL:String, sources:EventSources?
    
    public init(mp3URL: String, sources: EventSources?) {
        self.mp3URL = mp3URL
        self.sources = sources
    }
}
