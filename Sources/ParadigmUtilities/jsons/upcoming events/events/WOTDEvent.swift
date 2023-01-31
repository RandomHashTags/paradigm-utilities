//
//  WOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class WOTDEvent : GenericUpcomingEvent {
    public let examples:Set<String>?, pronunciation_url:String?, syllables:String, grammar_type:String
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: Set<Country>?, subdivisions: [any SovereignStateSubdivision]?, examples: Set<String>?, pronunciation_url: String?, syllables: String, grammar_type: String) {
        self.examples = examples
        self.pronunciation_url = pronunciation_url
        self.syllables = syllables
        self.grammar_type = grammar_type
        super.init(type: UpcomingEventType.word_of_the_day, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: WOTDEventValueKeys.self)
        examples = try container.decode(Set<String>.self, forKey: .examples)
        pronunciation_url = try container.decodeIfPresent(String.self, forKey: .pronunciation_url)
        syllables = try container.decode(String.self, forKey: .syllables)
        grammar_type = try container.decode(String.self, forKey: .grammar_type)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:WOTDEventValueKeys = key as? WOTDEventValueKeys else { return nil }
        switch key {
        case .examples: return examples
        case .pronunciation_url: return pronunciation_url
        case .syllables: return syllables
        case .grammar_type: return grammar_type
        }
    }
}

public enum WOTDEventValueKeys : String, UpcomingEventValueKeys {
    case examples
    case pronunciation_url
    case syllables
    case grammar_type
    
    public func getCategory() -> UpcomingEventValueCategory {
        switch self {
        case .examples:
            return UpcomingEventValueCategory.word_of_the_day_post_details
        default:
            return UpcomingEventValueCategory.word_of_the_day_details
        }
    }
    
    public func getValueCellType() -> UpcomingEventValueCellType {
        switch self {
        case .pronunciation_url:
            return UpcomingEventValueCellType.audio
        default:
            return UpcomingEventValueCellType.label
        }
    }
    public func getValuePrefix() -> String? {
        switch self {
        case .examples: return "Examples:\n\n"
        case .syllables: return "Syllables: "
        case .grammar_type: return "Type: "
        default: return nil
        }
    }
}
