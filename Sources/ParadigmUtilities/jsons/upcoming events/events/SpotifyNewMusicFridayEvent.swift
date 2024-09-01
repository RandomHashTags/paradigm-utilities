//
//  SpotifyNewMusicFridayEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpotifyNewMusicFridayEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.spotify_new_music_friday
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