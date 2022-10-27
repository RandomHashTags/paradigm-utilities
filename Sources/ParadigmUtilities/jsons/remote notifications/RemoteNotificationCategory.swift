//
//  RemoteNotificationCategory.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public enum RemoteNotificationCategory : String, CaseIterable, JsonableNoTranslationKeys {
    case apple
    //case playstation
    //case video_game
    case weather
    
    public static func valueOf(subcategory: String) -> (any RemoteNotificationSubcategory)? {
        for category in RemoteNotificationCategory.allCases {
            for sub in category.getSubcategories() {
                if subcategory.elementsEqual("\(sub)") {
                    return sub
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
        //case .playstation: return "PlayStation"
        //case .video_game: return "Video Game"
        case .weather: return "Weather"
        }
    }
    
    public func valueOfSubcategory(_ string: String) -> (any RemoteNotificationSubcategory)? {
        return getSubcategories().first(where: { string.elementsEqual($0.getIdentifier()) })
    }
    public func getSubcategories() -> [any RemoteNotificationSubcategory] {
        switch self {
        case .apple: return RemoteNotificationSubcategoryApple.allCases
        //case .playstation: return nil
        //case .video_game: return nil
        case .weather: return RemoteNotificationSubcategoryWeather.allCases
        }
    }
}
