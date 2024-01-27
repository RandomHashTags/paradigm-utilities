//
//  JOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct JOTDEvent : GenericUpcomingEvent {
    public typealias JSONKeys = JOTDEventValueKeys
    
    public var type : UpcomingEventType? {
        return UpcomingEventType.joke_of_the_day
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
    
    public let copyright:String
    public var question:String, answer:String
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, copyright: String, question: String, answer: String) {
        self.copyright = copyright
        self.question = question
        self.answer = answer
        
        self.event_date = event_date
        self.exact_start = nil
        self.exact_end = nil
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.joke_of_the_day.image_url_prefix, imageURL.starts(with: prefix) {
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
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: JOTDEventValueKeys.self)
        copyright = try container.decode(String.self, forKey: .copyright)
        question = try container.decode(String.self, forKey: .question)
        answer = try container.decode(String.self, forKey: .answer)
        
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
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .copyright: return copyright
        case .question: return question
        case .answer: return answer
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .question:
            question = value as! String
            break
        case .answer:
            answer = value as! String
            break
        default:
            break
        }
    }
}

public enum JOTDEventValueKeys : String, UpcomingEventValueKeys {
    case copyright
    case question
    case answer
    
    public var is_translatable : Bool {
        switch self {
        case .question, .answer:
            return true
        default:
            return false
        }
    }
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.joke_of_the_day
    }
}
