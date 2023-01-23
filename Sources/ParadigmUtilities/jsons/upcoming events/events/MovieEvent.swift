//
//  MovieEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class MovieEvent : GenericUpcomingEvent {
    public let release_info:String?, ratings:MovieRatings?, imdb_info:IMDbMovieDetails?, production_companies:[String]?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, youtube_video_ids: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, release_info: String?, ratings: MovieRatings?, imdb_info: IMDbMovieDetails?, production_companies: [String]?) {
        self.release_info = release_info
        self.ratings = ratings
        self.imdb_info = imdb_info
        self.production_companies = production_companies
        super.init(type: UpcomingEventType.movie, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: youtube_video_ids, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MovieEventValueKeys.self)
        release_info = try container.decodeIfPresent(String.self, forKey: .release_info)
        ratings = try container.decodeIfPresent(MovieRatings.self, forKey: .ratings)
        imdb_info = try container.decodeIfPresent(IMDbMovieDetails.self, forKey: .imdb_info)
        production_companies = try container.decodeIfPresent([String].self, forKey: .production_companies)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:MovieEventValueKeys = key as? MovieEventValueKeys else { return nil }
        switch key {
        case .release_info: return release_info
        case .ratings: return ratings
        case .imdb_info: return imdb_info
        case .production_companies: return production_companies
        }
    }
}

public enum MovieEventValueKeys : String, UpcomingEventValueKeys {
    case release_info
    case ratings
    case imdb_info
    case production_companies
    
    public func getCategory() -> UpcomingEventValueCategory {
        switch self {
        case .production_companies:
            return UpcomingEventValueCategory.movie_production_companies
        default:
            return UpcomingEventValueCategory.movie
        }
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .imdb_info:
            return UpcomingEventValueType.imdb_info
        case .production_companies:
            return UpcomingEventValueType.production_companies
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    public func getValueCellType() -> UpcomingEventValueCellType {
        switch self {
        case .production_companies:
            return UpcomingEventValueCellType.production_companies
        default:
            return UpcomingEventValueCellType.label
        }
    }
}
