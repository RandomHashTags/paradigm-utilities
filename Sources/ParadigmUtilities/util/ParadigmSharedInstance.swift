//
//  ParadigmSharedInstance.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation

public protocol ParadigmSharedInstance {
    static var shared_identifier : ParadigmSharedInstanceIdentifier { get }
    init()
}

public extension ParadigmSharedInstance {
    static var shared : Self {
        return get(identifier: shared_identifier)
    }
    static func get<T : ParadigmSharedInstance>(identifier: ParadigmSharedInstanceIdentifier) -> T {
        return ParadigmCache.get_shared_instances_cache().get_or_insert(identifier) {
            return T.init()
        } as! T
    }
    
    static func remove(identifier: ParadigmSharedInstanceIdentifier) {
        ParadigmCache.remove(api_version: APIVersion.latest, type: ParadigmCacheType.shared_instances, identifier: identifier)
    }
    func remove() {
        ParadigmCache.remove(api_version: APIVersion.latest, type: ParadigmCacheType.shared_instances, identifier: Self.shared_identifier)
    }
}

public enum ParadigmSharedInstanceIdentifier : Hashable {
    case async_task
    case custom(AnyHashable)
}
