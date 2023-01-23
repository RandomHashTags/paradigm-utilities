//
//  SpaceEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class SpaceEvent : GenericUpcomingEvent {
    public let news_url:String?, video_url:String?
    
    public init(exact_start:Int64, exact_end:Int64, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, news_url: String?, video_url: String?) {
        self.news_url = news_url
        self.video_url = video_url
        super.init(type: UpcomingEventType.space_event, event_date: nil, exact_start: exact_start, exact_end: exact_end, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceEventValueKeys.self)
        news_url = try container.decodeIfPresent(String.self, forKey: .news_url)
        video_url = try container.decodeIfPresent(String.self, forKey: .video_url)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:SpaceEventValueKeys = key as? SpaceEventValueKeys else { return nil }
        switch key {
        case .news_url: return news_url
        case .video_url: return video_url
        }
    }
}

public enum SpaceEventValueKeys : String, UpcomingEventValueKeys {
    case news_url
    case video_url
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.space_event
    }
}
