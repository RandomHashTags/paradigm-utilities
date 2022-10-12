//
//  SovereignStateInfoValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoValue : Jsonable {
    public let title:String, value:String, description:String?
    
    public init(title: String, value: String, description: String?) {
        self.title = title
        self.value = value
        self.description = description
    }
}
