//
//  SubdivisionStatute.swift
//
//
//  Created by Evan Anderson on 9/9/22.
//

import Foundation

public struct SubdivisionStatute : Jsonable {
    public let title:String, description:String?, subdivisions:[SubdivisionStatuteSubdivision]?, sources:EventSources
    
    public init(title: String, description: String?, subdivisions: [SubdivisionStatuteSubdivision]?, sources: EventSources) {
        self.title = title
        self.description = description
        self.subdivisions = subdivisions
        self.sources = sources
    }
}
