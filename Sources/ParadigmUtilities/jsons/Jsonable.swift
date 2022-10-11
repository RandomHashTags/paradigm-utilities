//
//  Jsonable.swift
//
//
//  Created by Evan Anderson on 9/8/22.
//

import Foundation

public protocol Jsonable : Hashable, Codable, Sendable {
    func getTranslatedKeys() -> [CodingKey]?
    func getClientRemovedKeys() -> [CodingKey]?
    //func getFolderPath() -> FolderPath?
}
public extension Jsonable {
    func getTranslatedKeys() -> [CodingKey]? {
        return nil
    }
    func getClientRemovedKeys() -> [CodingKey]? {
        return nil
    }
    //func getFolderPath() -> FolderPath? {
    //    return nil
    //}
    
    func toString() -> String {
        do {
            let data:Data = try JSONEncoder().encode(self)
            return String(data: data, encoding: .utf8) ?? "{}"
        } catch {
            return "{}"
        }
    }
}
