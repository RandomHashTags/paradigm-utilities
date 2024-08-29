//
//  VideoGameEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct VideoGameEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public let platforms:[String]
    public var genres:[String]
    
    public init(platforms: [String], genres: [String]) {
        self.platforms = platforms
        self.genres = genres
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .platforms: return platforms
        case .genres: return genres
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .genres:
            genres = value as! [String]
            break
        default:
            break
        }
    }
}

public extension VideoGameEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case platforms
        case genres
        
        public var category : UpcomingEventValueCategory {
            switch self {
            case .platforms:
                return UpcomingEventValueCategory.video_game_details
            case .genres:
                return UpcomingEventValueCategory.video_game_genres
            }
        }
    }
}