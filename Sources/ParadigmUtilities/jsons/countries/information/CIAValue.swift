//
//  CIAValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct CIAValue : SovereignStateInformationValue {    
    public let id:String
    public var title:String, value:String, sources:EventSources?
    
    public init(id: String, title: String, value: String, sources: EventSources?) {
        self.id = id
        self.title = title
        self.value = value
        self.sources = sources
    }
}