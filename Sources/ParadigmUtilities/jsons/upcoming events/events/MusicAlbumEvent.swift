//
//  MusicAlbumEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct MusicAlbumEvent : UpcomingEventData {
    public typealias JSONKeys = ValueKeys
    
    public let artist:String, spotify_details:SpotifyDetails?, itunes_details:ITunesDetails?
    
    public init(artist: String, spotify_details: SpotifyDetails?, itunes_details: ITunesDetails?) {
        self.artist = artist
        self.spotify_details = spotify_details
        self.itunes_details = itunes_details
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .artist: return artist
        case .spotify_details: return spotify_details
        case .itunes_details: return itunes_details
        }
    }
}

public extension MusicAlbumEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case artist
        case spotify_details
        case itunes_details
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.music_album
        }
        
        public var value_type : UpcomingEventValueType {
            switch self {
            case .spotify_details:
                return UpcomingEventValueType.details_spotify
            case .itunes_details:
                return UpcomingEventValueType.details_itunes
            default:
                return UpcomingEventValueType.default_type
            }
        }
    }
}