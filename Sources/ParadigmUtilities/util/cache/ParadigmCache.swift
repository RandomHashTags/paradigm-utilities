//
//  ParadigmCache.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation

public struct ParadigmCache {
    private static var cache:ParadigmNSCache<APIVersion, ParadigmNSCache<String, Any>> = ParadigmNSCache<APIVersion, ParadigmNSCache<String, Any>>()
    
    public static func get_or_load_cache<T, V>(api_version: APIVersion, type: ParadigmCacheType) -> ParadigmNSCache<T, V> {
        let type_identifier:String = type.id
        if let value:ParadigmNSCache<T, V> = ParadigmCache.cache[api_version]?[type_identifier] as? ParadigmNSCache<T, V> {
            return value
        } else {
            if ParadigmCache.cache[api_version] == nil {
                ParadigmCache.cache[api_version] = ParadigmNSCache<String, Any>()
            }
            ParadigmCache.cache[api_version]![type_identifier] = ParadigmNSCache<T, V>()
            return ParadigmCache.cache[api_version]![type_identifier] as! ParadigmNSCache<T, V>
        }
    }
    
    public static func get<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: String) -> V? {
        let cache:ParadigmNSCache<String, V> = get_or_load_cache(api_version: api_version, type: type)
        return cache[identifier]
    }
    public static func set<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: String, value: V) {
        get_or_load_cache(api_version: api_version, type: type)[identifier] = value
    }
    
    public static func remove_all() {
        cache.remove_all()
    }
    public static func remove_all(api_version: APIVersion) {
        cache[api_version]?.remove_all()
    }
    public static func remove_all(api_version: APIVersion, type: ParadigmCacheType) {
        cache[api_version]?[type.id] = nil
    }
    public static func remove(api_version: APIVersion, type: ParadigmCacheType, identifier: String) {
        let cache:ParadigmNSCache<String, Any> = get_or_load_cache(api_version: api_version, type: type)
        cache[identifier] = nil
    }
    
    public static func get_or_load<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: String, load: @escaping () -> V) -> V {
        let cache:ParadigmNSCache<String, V> = get_or_load_cache(api_version: api_version, type: type)
        return cache.get_or_insert(identifier, load)
    }
    public static func get_or_load_async_throwable<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: String, load: @escaping () async throws -> V) async throws -> V {
        let cache:ParadigmNSCache<String, V> = get_or_load_cache(api_version: api_version, type: type)
        return try await cache.get_or_insert_async_throwable(identifier: identifier, identifier, load)
    }
    
    public static func get_or_load_optional<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: String, load: @escaping () -> V?) -> V? {
        let cache:ParadigmNSCache<String, V> = get_or_load_cache(api_version: api_version, type: type)
        return cache.get_or_insert_optional(identifier, load)
    }
    public static func get_or_load_optional_async_throwable<V>(api_version: APIVersion, type: ParadigmCacheType, identifier: String, load: @escaping () async throws -> V?) async throws -> V? {
        let cache:ParadigmNSCache<String, V> = get_or_load_cache(api_version: api_version, type: type)
        return try await cache.get_or_insert_optional_async_throwable(identifier: identifier, identifier, load)
    }
}