//
//  WikipediaStatisticsDimensions.swift
//  
//
//  Created by Evan Anderson on 10/26/22.
//

public struct WikipediaStatisticsDimensions : Jsonable {    
    public var length:String?, width:String?
    
    public init(length: String?, width: String?) {
        self.length = length
        self.width = width
    }
}