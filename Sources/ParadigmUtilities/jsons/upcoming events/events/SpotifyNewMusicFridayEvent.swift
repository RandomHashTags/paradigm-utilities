//
//  SpotifyNewMusicFridayEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpotifyNewMusicFridayEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public var tracks:[SpotifyTrack]
    
    public init(tracks: [SpotifyTrack]) {
        self.tracks = tracks
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .tracks: return tracks
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .tracks:
            tracks = value as! [SpotifyTrack]
            break
        }
    }
}

public extension SpotifyNewMusicFridayEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case tracks
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.spotify_new_music_friday_tracks
        }
        
        public var value_type : UpcomingEventValueType {
            return UpcomingEventValueType.spotify_tracks
        }
        public var value_cell_type : UpcomingEventValueCellType {
            switch self {
            case .tracks:
                return UpcomingEventValueCellType.spotify_tracks
            }
        }
    }
}