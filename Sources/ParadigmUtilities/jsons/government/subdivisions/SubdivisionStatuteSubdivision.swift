//
//  SubdivisionStatuteSubdivision.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

public struct SubdivisionStatuteSubdivision : Jsonable {    
    public var title:String, description:String, subdivisions:[SubdivisionStatuteSubdivision]?
    
    public init(title: String, description: String, subdivisions: [SubdivisionStatuteSubdivision]?) {
        self.title = title
        self.description = description
        self.subdivisions = subdivisions
    }
}
