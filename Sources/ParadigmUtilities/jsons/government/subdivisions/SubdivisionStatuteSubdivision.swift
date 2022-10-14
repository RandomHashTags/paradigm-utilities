//
//  SubdivisionStatuteSubdivision.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct SubdivisionStatuteSubdivision : Jsonable {
    public let title:String, description:String, subdivisions:[SubdivisionStatuteSubdivision]?
    
    public init(title: String, description: String, subdivisions: [SubdivisionStatuteSubdivision]?) {
        self.title = title
        self.description = description
        self.subdivisions = subdivisions
    }
}
