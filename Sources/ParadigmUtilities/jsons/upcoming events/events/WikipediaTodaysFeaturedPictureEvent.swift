//
//  WikipediaTodaysFeaturedPictureEvent.swift
//  
//
//  Created by Evan Anderson on 10/21/22.
//

import Foundation
import SwiftSovereignStates

public enum WikipediaTodaysFeaturedPictureEventCodingKeys : String, UpcomingEventCodingKeys {
    case videoURL
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.wikipedia_todays_featured_picture
    }
}

public final class WikipediaTodaysFeaturedPictureEvent : GenericUpcomingEvent {
    public let videoURL:String?
    
    public init(eventDate: EventDate!, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, videoURL: String?) {
        self.videoURL = videoURL
        super.init(type: UpcomingEventType.wikipedia_todays_featured_picture, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: WikipediaTodaysFeaturedPictureEventCodingKeys.self)
        videoURL = try container.decodeIfPresent(String.self, forKey: .videoURL)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:WikipediaTodaysFeaturedPictureEventCodingKeys = key as? WikipediaTodaysFeaturedPictureEventCodingKeys else { return nil }
        switch key {
        case .videoURL: return videoURL
        }
    }
}
