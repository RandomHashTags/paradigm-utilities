//
//  WOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct WOTDEvent : GenericUpcomingEvent {
    public typealias ValueKeys = WOTDEventValueKeys
    
    public var type : UpcomingEventType {
        return UpcomingEventType.word_of_the_day
    }
    public let event_date:EventDate?, exact_start:Int64?, exact_end:Int64?
    public var custom_type_singular_name:String?
    
    public var title:String, description:String?
    public var location:String?
    public var image_url:String? {
        didSet {
            guard let imageURL:String = image_url, let prefix:String = type.image_url_prefix, imageURL.starts(with: prefix) else { return }
            image_url = imageURL.substring(from: prefix.count)
        }
    }
    public let youtube_video_ids:[String]?
    public var sources:EventSources
    public var hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    
    public var examples:[String]?
    public let pronunciation_url:String?, syllables:String, grammar_type:String
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, examples: [String]?, pronunciation_url: String?, syllables: String, grammar_type: String) {
        self.examples = examples
        self.pronunciation_url = pronunciation_url
        self.syllables = syllables
        self.grammar_type = grammar_type
        
        self.event_date = event_date
        self.exact_start = nil
        self.exact_end = nil
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.word_of_the_day.image_url_prefix, imageURL.starts(with: prefix) {
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
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: WOTDEventValueKeys.self)
        examples = try container.decode([String].self, forKey: .examples)
        pronunciation_url = try container.decodeIfPresent(String.self, forKey: .pronunciation_url)
        syllables = try container.decode(String.self, forKey: .syllables)
        grammar_type = try container.decode(String.self, forKey: .grammar_type)
        
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
    
    public func getKeyValue(key: ValueKeys) -> Any? {
        switch key {
        case .examples: return examples
        case .pronunciation_url: return pronunciation_url
        case .syllables: return syllables
        case .grammar_type: return grammar_type
        }
    }
    public mutating func setKeyValue<T>(key: ValueKeys, value: T) {
        switch key {
        case .examples:
            examples = value as? [String]
            break
        default:
            break
        }
    }
}

public enum WOTDEventValueKeys : String, UpcomingEventValueKeys {
    case examples
    case pronunciation_url
    case syllables
    case grammar_type
    
    public var is_translatable : Bool {
        switch self {
        case .examples:
            return true
        default:
            return false
        }
    }
    
    public var category : UpcomingEventValueCategory {
        switch self {
        case .examples:
            return UpcomingEventValueCategory.word_of_the_day_post_details
        default:
            return UpcomingEventValueCategory.word_of_the_day_details
        }
    }
    
    public var value_cell_type : UpcomingEventValueCellType {
        switch self {
        case .pronunciation_url:
            return UpcomingEventValueCellType.audio
        default:
            return UpcomingEventValueCellType.label
        }
    }
    public var value_prefix : String? {
        switch self {
        case .examples: return "Examples:\n\n"
        case .syllables: return "Syllables: "
        case .grammar_type: return "Type: "
        default: return nil
        }
    }
}
