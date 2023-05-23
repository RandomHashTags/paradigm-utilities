//
//  ParadigmSharedInstance.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation

public protocol ParadigmSharedInstance {
    init()
}

public extension ParadigmSharedInstance {
    static var shared : Self {
        return get(identifier: String(describing: Self.self))
    }
    static func get<T : ParadigmSharedInstance>(identifier: String) -> T {
        return ParadigmCache.get_or_load_cache(api_version: APIVersion.latest, type: ParadigmCacheType.shared_instances).get_or_insert(identifier) {
            return T.init()
        }
    }
    
    func remove() {
        ParadigmCache.remove(api_version: APIVersion.latest, type: ParadigmCacheType.shared_instances, identifier: String(describing: Self.self))
    }
}
