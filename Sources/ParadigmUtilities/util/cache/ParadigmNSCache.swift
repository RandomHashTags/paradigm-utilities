//
//  ParadigmNSCache.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation

public final class ParadigmNSCache<Key: Hashable, Value> : NSObject, NSCacheDelegate {
    private let wrapped:NSCache<WrappedKey, Entry> = NSCache<WrappedKey, Entry>()
    public private(set) var count:Int = 0
    
    public override init() {
        super.init()
        wrapped.delegate = self
    }
    
    public func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        count -= 1
    }
    
    public subscript(key: Key) -> Value? {
        get { value(forKey: key) }
        set {
            guard let value:Value = newValue else {
                remove_value(for_key: key)
                return
            }
            insert(value, forKey: key)
        }
    }
    
    public func get_or_insert(_ key: Key, _ handler: @escaping () -> Value) -> Value {
        if let value:Value = value(forKey: key) {
            return value
        }
        let value:Value = handler()
        insert(value, forKey: key)
        return value
    }
    public func get_or_insert_async_throwable(identifier: AnyHashable, _ key: Key, _ handler: @escaping () async throws -> Value) async throws -> Value {
        if let value:Value = value(forKey: key) {
            return value
        }
        return try await AsyncTask.get_result(identifier: identifier) {
            let value:Value = try await handler()
            self.insert(value, forKey: key)
            return value
        }!
    }
    
    public func get_or_insert_optional(_ key: Key, _ handler: @escaping () -> Value?) -> Value? {
        if let value:Value = value(forKey: key) {
            return value
        }
        guard let value:Value = handler() else { return nil }
        insert(value, forKey: key)
        return value
    }
    public func get_or_insert_optional_async_throwable(identifier: AnyHashable, _ key: Key, _ handler: @escaping () async throws -> Value?) async throws -> Value? {
        if let value:Value = value(forKey: key) {
            return value
        }
        return try await AsyncTask.get_result(identifier: identifier) {
            guard let value:Value = try await handler() else { return nil }
            self.insert(value, forKey: key)
            return value
        }
    }
    
    public func insert_if_absent(_ val: Value, for_key key: Key) {
        guard value(forKey: key) == nil else { return }
        insert(val, forKey: key)
    }
    /// increment count every time an item is inserted - count is decremented via delegate function (*certified bruh moment*)
    private func insert(_ value: Value, forKey key: Key) {
        let entry:Entry = Entry(value: value)
        let wrapped_key:WrappedKey = WrappedKey(key)
        wrapped.setObject(entry, forKey: wrapped_key)
        count += 1
    }
    private func value(forKey key: Key) -> Value? {
        return wrapped.object(forKey: WrappedKey(key))?.value
    }
    public func remove_value(for_key key: Key) {
        let wrapped_key:WrappedKey = WrappedKey(key)
        wrapped.removeObject(forKey: wrapped_key)
    }
    /// Empties the cache.
    public func remove_all() {
        wrapped.removeAllObjects()
    }
}

private extension ParadigmNSCache {
    final class WrappedKey : NSObject {
        let key:Key
        
        init(_ key: Key) {
            self.key = key
        }
        
        override var hash: Int {
            return key.hashValue
        }
        
        override func isEqual(_ object: Any?) -> Bool {
            guard let value:WrappedKey = object as? WrappedKey else { return false }
            return value.key == key
        }
    }
    
    final class Entry {
        let value:Value
        
        init(value: Value) {
            self.value = value
        }
    }
}
