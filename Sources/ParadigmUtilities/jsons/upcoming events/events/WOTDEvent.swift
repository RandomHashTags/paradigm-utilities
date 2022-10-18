//
//  WOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum WOTDEventCodingKeys : String, UpcomingEventCodingKeys {
    case examples
    case pronunciationURL
    case syllables
    case grammarType
    
    public func getCategory() -> UpcomingEventValueCategory {
        switch self {
        case .examples:
            return UpcomingEventValueCategory.word_of_the_day_post_details
        default:
            return UpcomingEventValueCategory.word_of_the_day_details
        }
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .pronunciationURL:
            return UpcomingEventValueType.audio
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    public func getValuePrefix() -> String? {
        switch self {
        case .examples: return "Examples:\n\n"
        case .syllables: return "Syllables: "
        case .grammarType: return "Type: "
        default: return nil
        }
    }
}

public final class WOTDEvent : GenericUpcomingEvent {
    public let examples:[String], pronunciationURL:String?, syllables:String, grammarType:String
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, examples: [String], pronunciationURL: String?, syllables: String, grammarType: String) {
        self.examples = examples
        self.pronunciationURL = pronunciationURL
        self.syllables = syllables
        self.grammarType = grammarType
        super.init(type: UpcomingEventType.word_of_the_day, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: youtubeVideoIDs, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: WOTDEventCodingKeys.self)
        examples = try container.decode([String].self, forKey: .examples)
        pronunciationURL = try container.decodeIfPresent(String.self, forKey: .pronunciationURL)
        syllables = try container.decode(String.self, forKey: .syllables)
        grammarType = try container.decode(String.self, forKey: .grammarType)
        try super.init(from: decoder)
    }
}
