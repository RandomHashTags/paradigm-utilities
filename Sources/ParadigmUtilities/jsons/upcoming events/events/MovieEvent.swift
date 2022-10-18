//
//  MovieEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum MovieEventCodingKeys : String, UpcomingEventCodingKeys {
    case releaseInfo
    case ratings
    case imdbInfo
    case productionCompanies
    
    public func getCategory() -> UpcomingEventValueCategory {
        switch self {
        case .productionCompanies:
            return UpcomingEventValueCategory.movie_production_companies
        default:
            return UpcomingEventValueCategory.movie
        }
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .imdbInfo:
            return UpcomingEventValueType.imdb_info
        case .productionCompanies:
            return UpcomingEventValueType.production_companies
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
}

public final class MovieEvent : GenericUpcomingEvent {
    public let releaseInfo:String?, ratings:String?, imdbInfo:IMDbMovieDetails?, productionCompanies:[PreMovieProductionCompany]?
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, releaseInfo: String?, ratings: String?, imdbInfo: IMDbMovieDetails?, productionCompanies: [PreMovieProductionCompany]?) {
        self.releaseInfo = releaseInfo
        self.ratings = ratings
        self.imdbInfo = imdbInfo
        self.productionCompanies = productionCompanies
        super.init(type: UpcomingEventType.movie, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
