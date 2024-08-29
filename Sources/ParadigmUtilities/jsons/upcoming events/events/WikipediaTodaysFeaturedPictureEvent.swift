//
//  WikipediaTodaysFeaturedPictureEvent.swift
//  
//
//  Created by Evan Anderson on 10/21/22.
//

public struct WikipediaTodaysFeaturedPictureEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public let video_url:String?
    
    public init(video_url: String?) {
        self.video_url = video_url
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .video_url: return video_url
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
    }
}

public extension WikipediaTodaysFeaturedPictureEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case video_url
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.wikipedia_todays_featured_picture
        }
    }
}