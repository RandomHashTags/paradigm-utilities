//
//  ParadigmCache.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

public struct ParadigmCache {
    public static var cache:ParadigmNSCache<APIVersion, ParadigmNSCache<AnyHashable, Any>> = ParadigmNSCache<APIVersion, ParadigmNSCache<AnyHashable, Any>>()
    
    public static func get_or_load_cache<V>(api_version: APIVersion, type: ParadigmCacheType) -> ParadigmNSCache<AnyHashable, V> {
        if let value:ParadigmNSCache<AnyHashable, V> = ParadigmCache.cache[api_version]?[type] as? ParadigmNSCache<AnyHashable, V> {
            return value
        } else {
            return ParadigmCache.cache.get_or_insert(api_version, { ParadigmNSCache<AnyHashable, Any>() }).get_or_insert(type, { ParadigmNSCache<AnyHashable, V>() }) as! ParadigmNSCache<AnyHashable, V>
        }
    }
    
    public static func get<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable) -> V? {
        let cache:ParadigmNSCache<AnyHashable, V> = get_or_load_cache(api_version: api_version, type: type)
        return cache[identifier]
    }
    public static func set<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable, value: V) {
        get_or_load_cache(api_version: api_version, type: type)[identifier] = value
    }
    
    public static func remove_all() {
        cache.remove_all()
    }
    public static func remove_all(api_version: APIVersion) {
        cache[api_version]?.remove_all()
    }
    public static func remove_all(api_version: APIVersion, type: ParadigmCacheType) {
        cache[api_version]?[type] = nil
    }
    public static func remove(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable) {
        let cache:ParadigmNSCache<AnyHashable, Any> = get_or_load_cache(api_version: api_version, type: type)
        cache[identifier] = nil
    }
    
    public static func get_or_load<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable, load: @escaping () -> V) -> V {
        let cache:ParadigmNSCache<AnyHashable, V> = get_or_load_cache(api_version: api_version, type: type)
        return cache.get_or_insert(identifier, load)
    }
    public static func get_or_load_async_throwable<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable, load: @escaping () async throws -> V) async throws -> V {
        let cache:ParadigmNSCache<AnyHashable, V> = get_or_load_cache(api_version: api_version, type: type)
        return try await cache.get_or_insert_async_throwable(identifier: identifier, identifier, load)
    }
    
    public static func get_or_load_optional<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable, load: @escaping () -> V?) -> V? {
        let cache:ParadigmNSCache<AnyHashable, V> = get_or_load_cache(api_version: api_version, type: type)
        return cache.get_or_insert_optional(identifier, load)
    }
    public static func get_or_load_optional_async_throwable<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: AnyHashable, load: @escaping () async throws -> V?) async throws -> V? {
        let cache:ParadigmNSCache<AnyHashable, V> = get_or_load_cache(api_version: api_version, type: type)
        return try await cache.get_or_insert_optional_async_throwable(identifier: identifier, identifier, load)
    }
}

public extension ParadigmCache {
    /// should return ---> _ParadigmNSCache<ParadigmSharedInstanceIdentifier, any ParadigmSharedInstance>_
    static func get_shared_instances_cache() -> ParadigmNSCache<AnyHashable, any ParadigmSharedInstance> {
        return ParadigmCache.get_or_load_cache(api_version: APIVersion.latest, type: ParadigmCacheType.shared_instances)
    }
}
