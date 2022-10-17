//
//  Jsonable.swift
//
//
//  Created by Evan Anderson on 9/8/22.
//

import Foundation

public protocol Jsonable : Hashable, Codable {
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
    
    func toData() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
    func toString() -> String? {
        guard let data:Data = toData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
