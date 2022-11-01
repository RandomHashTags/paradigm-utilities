//
//  Jsonable.swift
//
//
//  Created by Evan Anderson on 9/8/22.
//

import Foundation
import SwiftSovereignStates
import ZippyJSON
#if canImport(Vapor)
import Vapor
#endif

public protocol JsonableProtocol : Hashable, Codable {
    associatedtype TranslationKeys : JsonableTranslationKey = NoTranslationKeys
    associatedtype OmittableKeys : JsonableOmittableKey = NoOmittableKeys
    
    func getTranslations() -> [Language:String]?
    //func getFolderPath() -> FolderPath?
    
    func toData() -> Data?
    func toData(language: Language, omittedKeys: [String]?) async -> Data?
    func toString() -> String?
    func toString(language: Language, omittedKeys: [String]?) async -> String?
    
    func getTranslationKeyValue(key: TranslationKeys) -> Any?
    mutating func setTranslationKeyValue<T>(key: TranslationKeys, value: T)
    
    func getOmittableKeyValue(key: OmittableKeys) -> (any CodableOmittableProtocol)?
    mutating func setOmittableKeyValue<T: CodableOmittableProtocol>(key: OmittableKeys, value: T)
}

#if canImport(Vapor)
public protocol Jsonable : JsonableProtocol, AsyncResponseEncodable {
}
public extension Jsonable {
    func encodeResponse(for request: Request) async throws -> Response {
        let language:Language = request.language, omittValues:[String]? = request.query.getOmittValues()
        let string:String = await self.toString(language: language, omittedKeys: omittValues) ?? "{}"
        var headers:HTTPHeaders = HTTPHeaders()
        headers.add(name: .contentType, value: "application/json")
        return Response(status: .ok, version: .http1_1, headers: headers, body: .init(stringLiteral: string))
    }
}
public extension Request {
    var language : Language {
        guard let targetLanguage:String = headers.first(name: "Language") else { return Language.english }
        return Language.valueOf(targetLanguage) ?? Language.english
    }
}
public extension URLQueryContainer {
    func get(key: String) -> String? {
        do {
            return try get(at: key)
        } catch {
            return nil
        }
    }
    func getOmitt() -> String? {
        return get(key: "omitt")
    }
    func getOmittValues() -> [String]? {
        return getOmitt()?.components(separatedBy: ",")
    }
}
#else
public protocol Jsonable : JsonableProtocol {
}
#endif
public extension JsonableProtocol {
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
    func toData(language: Language, omittedKeys: [String]?) async -> Data? {
        return toData()
    }
    
    func toString() -> String? {
        guard let data:Data = toData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
    func toString(language: Language, omittedKeys: [String]?) async -> String? {
        guard let data:Data = await toData(language: language, omittedKeys: omittedKeys) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func getTranslationKeyValue(_ string: String) -> Any? {
        guard let key:TranslationKeys = TranslationKeys(rawValue: string) else { return nil }
        return getTranslationKeyValue(key: key)
    }
    func getTranslationKeyValue<T>(_ key: TranslationKeys) -> T? {
        return getTranslationKeyValue(key: key) as? T
    }
    
    func getOmittableKeyValue(_ string: String) -> (any CodableOmittableProtocol)? {
        guard let key:OmittableKeys = OmittableKeys(rawValue: string) else { return nil }
        return getOmittableKeyValue(key: key)
    }
    func getOmittableKeyValue(_ key: OmittableKeys) -> (any CodableOmittableProtocol)? {
        return getOmittableKeyValue(key: key)
    }
}

public extension JsonableProtocol where TranslationKeys == NoTranslationKeys {
    func getTranslationKeyValue(key: TranslationKeys) -> Any? {
        return nil
    }
    mutating func setTranslationKeyValue<T>(key: TranslationKeys, value: T) {
    }
}
public extension JsonableProtocol where OmittableKeys == NoOmittableKeys {
    func getOmittableKeyValue(key: OmittableKeys) -> (any CodableOmittableProtocol)? {
        return nil
    }
    mutating func setOmittableKeyValue<T: CodableOmittableProtocol>(key: OmittableKeys, value: T) {
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
