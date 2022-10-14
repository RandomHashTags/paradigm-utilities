//
//  SubdivisionStatuteItem.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteItem : Jsonable {
    public let type:SubdivisionLegislationType, id:String, title:String, isRepealed:Bool, sources:EventSources
    
    public init(type: SubdivisionLegislationType, id: String, title: String, isRepealed: Bool, sources: EventSources) {
        self.type = type
        self.id = id
        self.title = title
        self.isRepealed = isRepealed
        self.sources = sources
    }
}
