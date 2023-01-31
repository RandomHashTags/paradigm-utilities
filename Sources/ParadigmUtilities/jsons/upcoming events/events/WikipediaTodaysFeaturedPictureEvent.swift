//
//  WikipediaTodaysFeaturedPictureEvent.swift
//  
//
//  Created by Evan Anderson on 10/21/22.
//

import Foundation
import SwiftSovereignStates

public final class WikipediaTodaysFeaturedPictureEvent : GenericUpcomingEvent {
    public let video_url:String?
    
    public init(event_date: EventDate!, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: Set<Country>?, subdivisions: [any SovereignStateSubdivision]?, video_url: String?) {
        self.video_url = video_url
        super.init(type: UpcomingEventType.wikipedia_todays_featured_picture, event_date: event_date, title: title, description: description, location: location, image_url: image_url, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: WikipediaTodaysFeaturedPictureEventValueKeys.self)
        video_url = try container.decodeIfPresent(String.self, forKey: .video_url)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:WikipediaTodaysFeaturedPictureEventValueKeys = key as? WikipediaTodaysFeaturedPictureEventValueKeys else { return nil }
        switch key {
        case .video_url: return video_url
        }
    }
}

public enum WikipediaTodaysFeaturedPictureEventValueKeys : String, UpcomingEventValueKeys {
    case video_url
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.wikipedia_todays_featured_picture
    }
}
