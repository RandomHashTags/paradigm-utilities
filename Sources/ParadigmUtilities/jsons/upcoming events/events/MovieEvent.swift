//
//  MovieEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct MovieEvent : UpcomingEventData {
    public typealias JSONKeys = ValueKeys
    
    public let release_info:String?, ratings:MovieRatings?
    public var imdb_info:IMDbMovieDetails?
    public let production_companies:[String]?
    
    public init(release_info: String?, ratings: MovieRatings?, imdb_info: IMDbMovieDetails?, production_companies: [String]?) {
        self.release_info = release_info
        self.ratings = ratings
        self.imdb_info = imdb_info
        self.production_companies = production_companies
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .release_info: return release_info
        case .ratings: return ratings
        case .imdb_info: return imdb_info
        case .production_companies: return production_companies
        }
    }
}

public extension MovieEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case release_info
        case ratings
        case imdb_info
        case production_companies
        
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

}
