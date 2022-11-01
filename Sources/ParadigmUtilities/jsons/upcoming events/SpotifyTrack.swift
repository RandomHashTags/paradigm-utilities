//
//  SpotifyTrack.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyTrack : Jsonable {
    public typealias ValueKeys = SpotifyTrackValueKeys
    
    public let name:String, duration:Int64, artists:[SpotifyArtist]?, imageURL:String?, explicit:Bool, previewURL:String?
    public var sources:EventSources?
    
    public init(name: String, duration: Int64, artists: [SpotifyArtist]?, imageURL: String?, explicit: Bool, previewURL: String?, sources: EventSources?) {
        self.name = name
        self.duration = duration
        self.artists = artists
        self.imageURL = imageURL
        self.explicit = explicit
        self.previewURL = previewURL
        self.sources = sources
    }
    
    public func getKeyValue(key: SpotifyTrackValueKeys) -> Any? {
        switch key {
        case .name: return name
        case .duration: return duration
        case .artists: return artists
        case .imageURL: return imageURL
        case .explicit: return explicit
        case .previewURL: return previewURL
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

public enum SpotifyTrackValueKeys : String, JsonableValueKeys {
    case name
    case duration
    case artists
    case imageURL
    case explicit
    case previewURL
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .sources:
            return true
        default:
            return false
        }
    }
}

public struct SpotifyArtist : Jsonable {
    public let id:String, name:String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
