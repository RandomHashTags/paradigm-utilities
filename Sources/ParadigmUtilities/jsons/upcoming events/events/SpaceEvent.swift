//
//  SpaceEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum SpaceEventCodingKeys : String, UpcomingEventCodingKeys {
    case newsURL
    case videoURL
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.space_event
    }
}

public final class SpaceEvent : GenericUpcomingEvent {
    public let newsURL:String?, videoURL:String?
    
    public init(exactStartMilliseconds:Int64, exactEndMilliseconds:Int64, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, newsURL: String?, videoURL: String?) {
        self.newsURL = newsURL
        self.videoURL = videoURL
        super.init(type: UpcomingEventType.space_event, eventDate: nil, exactStartMilliseconds: exactStartMilliseconds, exactEndMilliseconds: exactEndMilliseconds, customTypeSingularName: nil, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: youtubeVideoIDs, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceEventCodingKeys.self)
        newsURL = try container.decodeIfPresent(String.self, forKey: .newsURL)
        videoURL = try container.decodeIfPresent(String.self, forKey: .videoURL)
        try super.init(from: decoder)
    }
}
