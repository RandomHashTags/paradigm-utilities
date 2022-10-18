//
//  APODEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum APODEventCodingKeys : String, UpcomingEventCodingKeys {
    case copyright
    case videoURL
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.astronomy_picture_of_the_day
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .copyright:
            return .image_copyright
        case .videoURL:
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

public final class APODEvent : GenericUpcomingEvent {
    public let copyright:String?, videoURL:String?
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, copyright: String?, videoURL: String?) {
        self.copyright = copyright
        self.videoURL = videoURL
        super.init(type: UpcomingEventType.astronomy_picture_of_the_day, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: APODEventCodingKeys.self)
        copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        videoURL = try container.decodeIfPresent(String.self, forKey: .videoURL)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:APODEventCodingKeys = key as? APODEventCodingKeys else { return nil }
        switch key {
        case .copyright: return copyright
        case .videoURL: return videoURL
        }
    }
}
