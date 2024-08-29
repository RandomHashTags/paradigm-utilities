//
//  SubdivisionStatuteItem.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

public struct SubdivisionStatuteItem : Jsonable {    
    public let type:SubdivisionLegislationType, id:String
    public var title:String
    public let is_repealed:Bool
    public var sources:EventSources
    
    public init(type: SubdivisionLegislationType, id: String, title: String, is_repealed: Bool, sources: EventSources) {
        self.type = type
        self.id = id
        self.title = title
        self.is_repealed = is_repealed
        self.sources = sources
    }
}