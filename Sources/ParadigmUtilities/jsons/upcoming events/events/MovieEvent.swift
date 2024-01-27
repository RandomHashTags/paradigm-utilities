//
//  MovieEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public struct MovieEvent : GenericUpcomingEvent {
    public typealias JSONKeys = MovieEventValueKeys
    
    public var type : UpcomingEventType? {
        return UpcomingEventType.movie
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
    
    public let release_info:String?, ratings:MovieRatings?
    public var imdb_info:IMDbMovieDetails?
    public let production_companies:[String]?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, youtube_video_ids: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, release_info: String?, ratings: MovieRatings?, imdb_info: IMDbMovieDetails?, production_companies: [String]?) {
        self.release_info = release_info
        self.ratings = ratings
        self.imdb_info = imdb_info
        self.production_companies = production_companies
        
        self.event_date = event_date
        self.exact_start = nil
        self.exact_end = nil
        self.custom_type_singular_name = nil
        self.title = title
        self.description = description
        self.location = location
        if let imageURL:String = image_url, let prefix:String = UpcomingEventType.movie.image_url_prefix, imageURL.starts(with: prefix) {
            self.image_url = imageURL.substring(from: prefix.count)
        } else {
            self.image_url = image_url
        }
        self.youtube_video_ids = youtube_video_ids
        self.sources = sources
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
    }
    
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MovieEventValueKeys.self)
        release_info = try container.decodeIfPresent(String.self, forKey: .release_info)
        ratings = try container.decodeIfPresent(MovieRatings.self, forKey: .ratings)
        imdb_info = try container.decodeIfPresent(IMDbMovieDetails.self, forKey: .imdb_info)
        production_companies = try container.decodeIfPresent([String].self, forKey: .production_companies)
        
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
        case .release_info: return release_info
        case .ratings: return ratings
        case .imdb_info: return imdb_info
        case .production_companies: return production_companies
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .imdb_info:
            imdb_info = value as? IMDbMovieDetails
            break
        default:
            break
        }
    }
}

public enum MovieEventValueKeys : String, UpcomingEventValueKeys {
    case release_info
    case ratings
    case imdb_info
    case production_companies
    
    public var is_translatable : Bool {
        switch self {
        case .imdb_info:
            return true
        default:
            return false
        }
    }
    
    public var category : UpcomingEventValueCategory {
        switch self {
        case .production_companies:
            return UpcomingEventValueCategory.movie_production_companies
        default:
            return UpcomingEventValueCategory.movie
        }
    }
    
    public var value_type : UpcomingEventValueType {
        switch self {
        case .imdb_info:
            return UpcomingEventValueType.imdb_info
        case .production_companies:
            return UpcomingEventValueType.production_companies
        default:
            return UpcomingEventValueType.default_type
        }
    }
    public var value_cell_type : UpcomingEventValueCellType {
        switch self {
        case .production_companies:
            return UpcomingEventValueCellType.production_companies
        default:
            return UpcomingEventValueCellType.label
        }
    }
}
