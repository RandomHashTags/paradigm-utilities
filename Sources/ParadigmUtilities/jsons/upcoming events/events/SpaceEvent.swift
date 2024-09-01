//
//  SpaceEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpaceEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.space_event
    public typealias JSONKeys = ValueKeys
    
    public let news_url:String?, video_url:String?
    
    public init(news_url: String?, video_url: String?) {
        self.news_url = news_url
        self.video_url = video_url
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .news_url: return news_url
        case .video_url: return video_url
        }
    }
}

public extension SpaceEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case news_url
        case video_url
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.space_event
        }
    }
}