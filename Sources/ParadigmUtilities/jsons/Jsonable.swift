//
//  Jsonable.swift
//
//
//  Created by Evan Anderson on 9/8/22.
//

import Foundation
import SwiftSovereignStates

public protocol JsonableProtocol : Hashable, Codable {
    associatedtype JSONKeys : JsonableKeys = NoJsonableKeys
    
    func getKeyValue(key: JSONKeys) -> Any?
    mutating func setKeyValue<T>(key: JSONKeys, value: T)
}

public protocol Jsonable : JsonableProtocol {
}
public extension JsonableProtocol {
    func getValueKeys() -> JSONKeys.AllCases {
        return JSONKeys.allCases
    }
    
    func getKeyValue(_ key: String) -> Any? {
        guard let key:JSONKeys = JSONKeys(rawValue: key) else { return nil }
        return getKeyValue(key: key)
    }
    mutating func setKeyValue<T>(_ key: String, value: T) {
        guard let key:JSONKeys = JSONKeys(rawValue: key) else { return }
        setKeyValue(key: key, value: value)
    }
}

public protocol JsonableKeys : CodingKey, CaseIterable, RawRepresentable where RawValue == String {
}

public extension Jsonable where JSONKeys == NoJsonableKeys {
    func getKeyValue(key: JSONKeys) -> Any? {
        return nil
    }
    func setKeyValue<T>(key: JSONKeys, value: T) {
    }
}
public enum NoJsonableKeys : String, JsonableKeys {
    case bruh
}
