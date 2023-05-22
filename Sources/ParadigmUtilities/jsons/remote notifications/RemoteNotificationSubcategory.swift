//
//  RemoteNotificationSubcategory.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation
import SwiftSovereignStates

public enum RemoteNotificationSubcategories {
    public static func valueOf(_ identifier: String) -> (any RemoteNotificationSubcategory)? {
        for category in RemoteNotificationCategory.allCases {
            if let subcategory:any RemoteNotificationSubcategory = category.get_subcategory_type().init(rawValue: identifier) {
                return subcategory
            }
        }
        return nil
    }
}

public protocol RemoteNotificationSubcategory : Jsonable, RawRepresentable where RawValue == String {
    var category : RemoteNotificationCategory { get }
    var name : String { get }
    var is_conditional : Bool { get }
    func getAllValues() -> [Country:[String]]?
}

public extension RemoteNotificationSubcategory {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.category == rhs.category && lhs.rawValue.elementsEqual(rhs.rawValue)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(category)
        hasher.combine(rawValue)
    }
    
    func getAllValues() -> [Country:[String]]? {
        return nil
    }
    
    func wrapped() -> RemoteNotificationSubcategoryWrapper {
        return RemoteNotificationSubcategoryWrapper(self)
    }
    
    /*func getSubcategoryFolderPath(type: RemoteNotificationDeviceTokenType) -> FolderPath {
        return Folder.device_tokens_type_category_subcategory.getPath(replacements: ["type": "\(type)", "category": "\(getCategory())", "subcategory": "\(self)"])
    }
    func getSubcategoryFolderPath(type: RemoteNotificationDeviceTokenType, country: Country, parentKey: String) -> FolderPath {
        return Folder.device_tokens_type_category_subcategory_country_parentkey.getPath(replacements: ["type": "\(type)", "category": "\(getCategory())", "subcategory": "\(self)", "country": "\(country)", "parentKey": parentKey])
    }
    
    func toJSONObject() async -> JSONObject {
        var json:JSONObject = JSONObject()
        json.put(key: "name", value: getName(), translateKey: true)
        do {
            if let allValues:[String] = try await getAllValues() {
                json.put(key: "allValues", value: allValues, translateKey: true)
            }
        } catch {
            ParadigmUtilities.logError(server: .remote_notifications, message: "encountered error while trying to load allValues for subcategory \"\(self)\"", sender: "RemoteNotificationSubcategory", folder: "toJSONObject", error: error)
        }
        return json
    }*/
}

public struct RemoteNotificationSubcategoryWrapper : RemoteNotificationSubcategory {
    public var rawValue:String
    public let subcategory:any RemoteNotificationSubcategory
    
    public init(_ subcategory: any RemoteNotificationSubcategory) {
        self.rawValue = subcategory.rawValue
        self.subcategory = subcategory
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let identifier:String = try container.decode(String.self)
        guard let subcategory:any RemoteNotificationSubcategory = RemoteNotificationSubcategories.valueOf(identifier) else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "invalid RemoteNotificationSubcategory identifier \"" + identifier + "\"")
        }
        self.rawValue = identifier
        self.subcategory = subcategory
    }
    public init?(rawValue: String) {
        guard let subcategory:any RemoteNotificationSubcategory = RemoteNotificationSubcategories.valueOf(rawValue) else { return nil }
        self.rawValue = rawValue
        self.subcategory = subcategory
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public var category : RemoteNotificationCategory {
        return subcategory.category
    }
    public var name : String {
        return subcategory.name
    }
    public var is_conditional : Bool {
        return subcategory.is_conditional
    }
    public func getAllValues() -> [Country:[String]]? {
        return subcategory.getAllValues()
    }
}
