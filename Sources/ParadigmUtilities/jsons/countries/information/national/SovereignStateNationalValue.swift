//
//  SovereignStateNationalValue.swift
//  
//
//  Created by Evan Anderson on 10/21/22.
//

public protocol SovereignStateNationalValue : SovereignStateInformationValue {
    var pictures:[WikipediaPicture] { get }
    
    init(pictures: [WikipediaPicture], sources: EventSources?)
}
