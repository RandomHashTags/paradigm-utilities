//
//  APODEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class APODEvent : GenericUpcomingEvent {
    public let copyright:String?, video_url:String?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: Set<Country>?, subdivisions: [any SovereignStateSubdivision]?, copyright: String?, video_url: String?) {
        self.copyright = copyright
        self.video_url = video_url
        super.init(type: UpcomingEventType.astronomy_picture_of_the_day, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: APODEventValueKeys.self)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        video_url = try container.decodeIfPresent(String.self, forKey: .video_url)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:APODEventValueKeys = key as? APODEventValueKeys else { return nil }
        switch key {
        case .copyright: return copyright
        case .video_url: return video_url
        }
    }
}

public enum APODEventValueKeys : String, UpcomingEventValueKeys {
    case copyright
    case video_url
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.astronomy_picture_of_the_day
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .copyright:
            return .image_copyright
        case .video_url:
            return .video_url
        }
    }
    
    public func getValuePrefix() -> String? {
        switch self {
        case .copyright:
            return "Copyright: "
        default:
            return nil
        }
    }
}
