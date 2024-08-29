//
//  SovereignStateInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateInfoValue : Jsonable {    
    public var title:String, value:String, description:String?
    
    public init(title: String, value: String, description: String?) {
        self.title = title
        self.value = value
        self.description = description
    }
}