//
//  ProfessionalWrestlingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct ProfessionalWrestlingEvent : GenericUpcomingEvent {
    public typealias ValueKeys = ProfessionalWrestlingEventValueKeys
    
    public var type : UpcomingEventType? {
        return UpcomingEventType.sport_professional_wrestling
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
    
    public var main_event:String, notes:String?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, main_event: String, notes: String?) {
        self.main_event = main_event
        self.notes = notes
        
        self.event_date = event_date
        self.exact_start = nil
        self.exact_end = nil
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.sport_professional_wrestling.image_url_prefix, imageURL.starts(with: prefix) {
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
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: ProfessionalWrestlingEventValueKeys.self)
        main_event = try container.decode(String.self, forKey: .main_event)
        notes = try container.decodeIfPresent(String.self, forKey: .notes)
        
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
        case .main_event: return main_event
        case .notes: return notes
        }
    }
    public mutating func setKeyValue<T>(key: ValueKeys, value: T) {
        switch key {
        case .main_event:
            main_event = value as! String
            break
        case .notes:
            notes = value as? String
            break
        }
    }
}

public enum ProfessionalWrestlingEventValueKeys : String, UpcomingEventValueKeys {
    case main_event
    case notes
    
    public var is_translatable : Bool {
        return true
    }
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.wrestling_details
    }
}
