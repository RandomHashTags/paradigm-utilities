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
    associatedtype ValueKeys : JsonableValueKeys = NoJsonableValueKeys
    
    func getTranslations() -> [Language:String]?
    //func getFolderPath() -> FolderPath?
    
    func toData() -> Data?
    func toData(language: Language, omittedKeys: [String]?) async -> Data?
    func toString() -> String?
    func toString(language: Language, omittedKeys: [String]?) async -> String?
    
    func getKeyValue(key: ValueKeys) -> Any?
    mutating func setKeyValue<T>(key: ValueKeys, value: T)
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
    func getValueKeys() -> ValueKeys.AllCases {
        return ValueKeys.allCases
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
    
    func getKeyValue(_ key: String) -> Any? {
        guard let key:ValueKeys = ValueKeys(rawValue: key) else { return nil }
        return getKeyValue(key: key)
    }
    mutating func setKeyValue<T>(_ key: String, value: T) {
        guard let key:ValueKeys = ValueKeys(rawValue: key) else { return }
        setKeyValue(key: key, value: value)
    }
    
    func getOmittableKeyValue(_ string: String) -> (any CodableOmittableProtocol)? {
        guard let key:ValueKeys = ValueKeys(rawValue: string) else { return nil }
        return getOmittableKeyValue(key)
    }
    func getOmittableKeyValue(_ key: ValueKeys) -> (any CodableOmittableProtocol)? {
        return getKeyValue(key: key) as? (any CodableOmittableProtocol)
    }
    mutating func setOmittKeyValue(_ key: ValueKeys, value: Bool) {
        guard var omittable:(any CodableOmittableProtocol) = getOmittableKeyValue(key) else { return }
        omittable.omitted = value
        setKeyValue(key: key, value: omittable)
    }
}

public protocol JsonableValueKeys : CodingKey, CaseIterable, RawRepresentable where RawValue == String {
    func isTranslatable() -> Bool
    func isOmittable() -> Bool
}
public extension JsonableValueKeys {
    func isOmittable() -> Bool {
        return false
    }
}

public extension Jsonable where ValueKeys == NoJsonableValueKeys {
    func getKeyValue(key: ValueKeys) -> Any? {
        return nil
    }
    func setKeyValue<T>(key: ValueKeys, value: T) {
    }
}
public enum NoJsonableValueKeys : String, JsonableValueKeys {
    case bruh
    
    public func isTranslatable() -> Bool {
        return false
    }
    public func isOmittable() -> Bool {
        return false
    }
}
