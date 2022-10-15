//
//  RemoteNotificationSubcategory.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation
import SwiftSovereignStates

public protocol RemoteNotificationSubcategory : Jsonable {
    func getCategory() -> RemoteNotificationCategory
    func getName() -> String
    func isConditional() -> Bool
    func getAllValues() async throws -> [String]?
}

public extension RemoteNotificationSubcategory {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.getCategory() == rhs.getCategory() && lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(getCategory())
        hasher.combine(getIdentifier())
    }
    
    func getIdentifier() -> String {
        return String(describing: self)
    }
    func getAllValues() async throws -> [String]? {
        return nil
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

/*
public struct RemoteNotificationSubcategoryWrapper : RemoteNotificationSubcategory {
    public let subcategory:any RemoteNotificationSubcategory
    
    public init(subcategory: any RemoteNotificationSubcategory) {
        self.subcategory = subcategory
    }
    
    public func getCategory() -> RemoteNotificationCategory {
        return subcategory.getCategory()
    }
    
    public func getName() -> String {
        return subcategory.getName()
    }
    
    public func isConditional() -> Bool {
        return subcategory.isConditional()
    }
}
*/
