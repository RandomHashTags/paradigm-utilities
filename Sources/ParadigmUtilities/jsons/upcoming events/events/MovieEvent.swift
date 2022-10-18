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
    public func getValueCellType() -> UpcomingEventValueCellType {
        switch self {
        case .productionCompanies:
            return UpcomingEventValueCellType.production_companies
        default:
            return UpcomingEventValueCellType.label
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
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MovieEventCodingKeys.self)
        releaseInfo = try container.decodeIfPresent(String.self, forKey: .releaseInfo)
        ratings = try container.decodeIfPresent(String.self, forKey: .ratings)
        imdbInfo = try container.decodeIfPresent(IMDbMovieDetails.self, forKey: .imdbInfo)
        productionCompanies = try container.decodeIfPresent([PreMovieProductionCompany].self, forKey: .productionCompanies)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:MovieEventCodingKeys = key as? MovieEventCodingKeys else { return nil }
        switch key {
        case .releaseInfo: return releaseInfo
        case .ratings: return ratings
        case .imdbInfo: return imdbInfo
        case .productionCompanies: return productionCompanies
        }
    }
}
