//
//  NationalAnthem.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct NationalAnthem : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, mp3URL:String, sources:EventSources?
    
    public init(mp3URL: String, sources: EventSources?) {
        type = .national
        info = .national_anthem
        self.mp3URL = mp3URL
        self.sources = sources
    }
}
