//
//  APODEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct APODEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public let copyright:String?, video_url:String?
    
    public init(copyright: String?, video_url: String?) {
        self.copyright = copyright
        self.video_url = video_url
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .copyright: return copyright
        case .video_url: return video_url
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
    }
}

public extension APODEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case copyright
        case video_url
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.astronomy_picture_of_the_day
        }
        
        public var value_type : UpcomingEventValueType {
            switch self {
            case .copyright:
                return .image_copyright
            case .video_url:
                return .video_url
            }
        }
        
        public var value_prefix : String? {
            switch self {
            case .copyright:
                return "Copyright: "
            default:
                return nil
            }
        }
    }
}