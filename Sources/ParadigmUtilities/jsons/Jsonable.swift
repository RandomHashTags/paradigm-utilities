//
//  Jsonable.swift
//
//
//  Created by Evan Anderson on 9/8/22.
//

import Foundation
import SwiftSovereignStates
import ZippyJSON

public protocol Jsonable : Hashable, Codable {
    associatedtype TranslationKeys : JsonableTranslationKey = NoTranslationKeys
    associatedtype OmittableKeys : JsonableOmittableKey = NoOmittableKeys
    
    func getTranslations() -> [Language:String]?
    //func getFolderPath() -> FolderPath?
    
    func getTranslationKeyValue(key: TranslationKeys) -> Any?
    mutating func setTranslationKeyValue<T>(key: TranslationKeys, value: T)
    
    func getOmittableKeyValue<T: Hashable>(key: OmittableKeys) -> CodableOmittable<T>?
}
public extension Jsonable {
    func getTranslationKeys() -> TranslationKeys.AllCases {
        return TranslationKeys.allCases
    }
    func getOmittableKeys() -> OmittableKeys.AllCases {
        return OmittableKeys.allCases
    }
    func getTranslations() -> [Language:String]? {
        return nil
    }
    //func getFolderPath() -> FolderPath? {
    //    return nil
    //}
    
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func toString() -> String? {
        guard let data:Data = toData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func getTranslationKeyValue<T>(_ key: TranslationKeys) -> T? {
        return getTranslationKeyValue(key: key) as? T
    }
}

public extension Jsonable where TranslationKeys == NoTranslationKeys {
    func getTranslationKeyValue(key: TranslationKeys) -> Any? {
        return nil
    }
    mutating func setTranslationKeyValue<T>(key: TranslationKeys, value: T) {
    }
}
public extension Jsonable where OmittableKeys == NoOmittableKeys {
    func getOmittableKeyValue<T: Hashable>(key: OmittableKeys) -> CodableOmittable<T>? {
        return nil
    }
}

public protocol JsonableTranslationKey : CodingKey, CaseIterable, RawRepresentable where RawValue == String {
    func isTranslatable() -> Bool
}
public extension JsonableTranslationKey {
    func isTranslatable() -> Bool {
        return true
    }
}
public enum NoTranslationKeys : String, JsonableTranslationKey {
    case bruh
    
    public func isTranslatable() -> Bool {
        return false
    }
}


public protocol JsonableOmittableKey : CodingKey, CaseIterable, RawRepresentable where RawValue == String {
    func isOmittable() -> Bool
}
public extension JsonableOmittableKey {
    func isOmittable() -> Bool {
        return true
    }
}
public enum NoOmittableKeys : String, JsonableOmittableKey {
    case bruh
    
    public func isOmittable() -> Bool {
        return false
    }
}
