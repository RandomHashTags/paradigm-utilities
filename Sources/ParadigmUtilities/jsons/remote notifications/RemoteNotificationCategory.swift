//
//  RemoteNotificationCategory.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public enum RemoteNotificationCategory : String, CaseIterable, Jsonable {
    case apple
    case playstation
    case video_game
    case weather
    
    public static func valueOf(_ string: String) -> RemoteNotificationCategory? {
        return RemoteNotificationCategory.allCases.first(where: { string.elementsEqual("\($0)") })
    }
    public static func valueOf(subcategory: String) -> (any RemoteNotificationSubcategory)? {
        for category in RemoteNotificationCategory.allCases {
            if let subcategories:[any RemoteNotificationSubcategory] = category.getSubcategories() {
                for sub in subcategories {
                    if subcategory.elementsEqual("\(sub)") {
                        return sub
                    }
                }
            }
        }
        return nil
        /*
        return RemoteNotificationCategory.allCases.compactMap({ category -> some RemoteNotificationSubcategory? in
            guard let sub = category.valueOfSubcategory(string: subcategory) else { return Optional<RemoteNotificationSubcategory>.none }
            return sub
        }).first*/
    }
    
    public func getName() -> String {
        switch self {
        case .apple: return "Apple"
        case .playstation: return "PlayStation"
        case .video_game: return "Video Game"
        case .weather: return "Weather"
        }
    }
    
    public func valueOfSubcategory(_ string: String) -> (any RemoteNotificationSubcategory)? {
        guard let subcategories:[any RemoteNotificationSubcategory] = getSubcategories() else { return nil }
        return subcategories.first(where: { string.elementsEqual("\($0)") })
    }
    public func getSubcategories() -> [any RemoteNotificationSubcategory]? {
        switch self {
        case .apple: return RemoteNotificationSubcategoryApple.allCases
        case .playstation: return nil
        case .video_game: return nil
        case .weather: return RemoteNotificationSubcategoryWeather.allCases
        }
    }
}
