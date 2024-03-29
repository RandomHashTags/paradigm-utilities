//
//  APODEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct APODEvent : GenericUpcomingEvent {
    public typealias JSONKeys = APODEventValueKeys
    
    public var type : UpcomingEventType? {
        return UpcomingEventType.astronomy_picture_of_the_day
    }
    public let event_date:EventDate?, exact_start:Int64?, exact_end:Int64?
    public var custom_type_singular_name:String?
    
    public var title:String, description:String?
    public var location:String?
    public var image_url:String? {
        didSet {
            guard let imageURL:String = image_url, let prefix:String = type?.image_url_prefix, imageURL.starts(with: prefix) else { return }
            image_url = imageURL.substring(from: prefix.count)
        }
    }
    public var youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public let copyright:String?, video_url:String?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, copyright: String?, video_url: String?) {
        self.copyright = copyright
        self.video_url = video_url
        
        self.event_date = event_date
        self.exact_start = nil
        self.exact_end = nil
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.astronomy_picture_of_the_day.image_url_prefix, imageURL.starts(with: prefix) {
            self.image_url = imageURL.substring(from: prefix.count)
        } else {
            self.image_url = image_url
        }
        self.youtube_video_ids = nil
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
    }
    
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: JSONKeys.self)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        video_url = try container.decodeIfPresent(String.self, forKey: .video_url)
        
        let generic_container:KeyedDecodingContainer = try decoder.container(keyedBy: GenericUpcomingEventValueKeys.self)
        event_date = try generic_container.decodeIfPresent(EventDate.self, forKey: .event_date)
        exact_start = try generic_container.decodeIfPresent(Int64.self, forKey: .exact_start)
        exact_end = try generic_container.decodeIfPresent(Int64.self, forKey: .exact_end)
        title = try generic_container.decode(String.self, forKey: .title)
        description = try generic_container.decodeIfPresent(String.self, forKey: .description)
        location = try generic_container.decodeIfPresent(String.self, forKey: .location)
        image_url = try generic_container.decodeIfPresent(String.self, forKey: .image_url)
        youtube_video_ids = try generic_container.decodeIfPresent([String].self, forKey: .youtube_video_ids)
        sources = try generic_container.decode(EventSources.self, forKey: .sources)
        hyperlinks = try generic_container.decodeIfPresent(Hyperlinks.self, forKey: .hyperlinks)
        countries = try generic_container.decodeIfPresent([Country].self, forKey: .countries)
        subdivisions = try generic_container.decodeIfPresent([String].self, forKey: .subdivisions)?.compactMap({ SovereignStateSubdivisions.valueOfCacheID($0)?.wrapped() })
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

public enum APODEventValueKeys : String, UpcomingEventValueKeys {
    case copyright
    case video_url
    
    public var is_translatable : Bool {
        return false
    }
    
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
