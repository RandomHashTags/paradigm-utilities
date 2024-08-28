//
//  SpotifyTrack.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyTrack : Jsonable {
    public typealias JSONKeys = SpotifyTrackValueKeys
    
    public let name:String, duration:Int64, artists:[SpotifyArtist]?, image_url:String?, explicit:Bool, preview_url:String?
    public var sources:EventSources?
    
    public init(name: String, duration: Int64, artists: [SpotifyArtist]?, image_url: String?, explicit: Bool, preview_url: String?, sources: EventSources?) {
        self.name = name
        self.duration = duration
        self.artists = artists
        self.image_url = image_url
        self.explicit = explicit
        self.preview_url = preview_url
        self.sources = sources
    }
    
    public func getKeyValue(key: SpotifyTrackValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .duration: return duration
        case .artists: return artists
        case .image_url: return image_url
        case .explicit: return explicit
        case .preview_url: return preview_url
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SpotifyTrackValueKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SpotifyTrackValueKeys : String, JsonableKeys {
    case name
    case duration
    case artists
    case image_url
    case explicit
    case preview_url
    case sources
}

public struct SpotifyArtist : Jsonable {
    public let id:String, name:String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
