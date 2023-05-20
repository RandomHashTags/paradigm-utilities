//
//  ParadigmCacheType.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation

public struct ParadigmCacheType : Identifiable {
    public var id:String
}

public extension ParadigmCacheType {
    static func get(_ identifier: String) -> ParadigmCacheType {
        return ParadigmCacheType(id: identifier)
    }
    
    static var shared_instances:ParadigmCacheType = get("shared_instances")
}
