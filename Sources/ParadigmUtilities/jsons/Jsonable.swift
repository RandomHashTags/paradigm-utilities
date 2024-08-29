//
//  Jsonable.swift
//
//
//  Created by Evan Anderson on 9/8/22.
//

import SwiftSovereignStates

public protocol JsonableProtocol : Hashable, Codable {
}

public protocol Jsonable : JsonableProtocol {
}
public protocol JsonableKeys : CodingKey, CaseIterable, RawRepresentable where RawValue == String {
}

public enum NoJsonableKeys : String, JsonableKeys {
    case bruh
}
