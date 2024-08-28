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
    
    func toData() -> Data?
    func toString() -> String?
    
    func getKeyValue(key: JSONKeys) -> Any?
    mutating func setKeyValue<T>(key: JSONKeys, value: T)
}

public protocol Jsonable : JsonableProtocol {
}
/*
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
        return try? get(at: key)
    }
    func getOmitt() -> String? {
        return get(key: "omitt")
    }
    func getOmittValues() -> [String]? {
        return getOmitt()?.components(separatedBy: ",")
    }
}*/
public extension JsonableProtocol {
    func getValueKeys() -> JSONKeys.AllCases {
        return JSONKeys.allCases
    }
    
    func toData() -> Data? {
        return try? ParadigmUtilities.json_encoder.encode(self)
    }
    
    func toString() -> String? {
        guard let data:Data = toData() else { return nil }
        return String(data: data, encoding: .utf8)
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
