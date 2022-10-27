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
    associatedtype TranslationKeys : JsonableTranslationKey
    
    func getTranslations() -> [Language:String]?
    //func getFolderPath() -> FolderPath?
    func getKeyValue(key: TranslationKeys) -> Any?
    mutating func setKeyValue<T>(key: TranslationKeys, value: T)
}
public extension Jsonable {
    func getKeys() -> TranslationKeys.AllCases {
        return TranslationKeys.allCases
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
    
    func getKeyValue<T>(_ key: TranslationKeys) -> T? {
        return getKeyValue(key: key) as? T
    }
    func getKeyValue(key: TranslationKeys) -> Any? {
        return nil
    }
    mutating func setKeyValue<T>(key: TranslationKeys, value: T) {
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

public protocol JsonableNoTranslationKeys : Jsonable where TranslationKeys == NoTranslationKeys {
}

public enum NoTranslationKeys : String, JsonableTranslationKey {
    case bruh
    
    public func isTranslatable() -> Bool {
        return false
    }
}
