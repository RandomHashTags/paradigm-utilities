//
//  NationalCapital.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct NationalCapital : SovereignStateInformationValue {    
    public let place:String
    public var notes:String?, sources:EventSources?
    
    public init(place: String, notes: String?, sources: EventSources?) {
        self.place = place
        self.notes = notes
        self.sources = sources
    }
}