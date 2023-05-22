//
//  RemoteNotificationCategory.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

import Foundation

public enum RemoteNotificationCategory : String, CaseIterable, Jsonable {
    case apple
    //case playstation
    //case video_game
    case weather
    
    public static func value_of(subcategory: String) -> (any RemoteNotificationSubcategory)? {
        for category in RemoteNotificationCategory.allCases {
            if let subcategory:any RemoteNotificationSubcategory = category.value_of_subcategory(subcategory) {
                return subcategory
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
    
    public func value_of_subcategory(_ string: String) -> (any RemoteNotificationSubcategory)? {
        return get_subcategory_type().init(rawValue: string)
    }
    public func get_subcategory_type() -> (any RemoteNotificationSubcategory.Type) {
        switch self {
        case .apple:   return RemoteNotificationSubcategoryApple.self
        case .weather: return RemoteNotificationSubcategoryWeather.self
        }
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
