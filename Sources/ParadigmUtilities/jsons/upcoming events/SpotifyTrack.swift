//
//  SpotifyTrack.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyTrack : Jsonable {
    public typealias TranslationKeys = SpotifyTrackTranslationKeys
    
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
    
    public func getKeyValue(key: SpotifyTrackTranslationKeys) -> Any? {
        switch key {
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SpotifyTrackTranslationKeys, value: T) {
        switch key {
        case .sources:
            sources = value as? EventSources
            break
        }
    }
}

public enum SpotifyTrackTranslationKeys : String, JsonableTranslationKey {
    case sources
}

public struct SpotifyArtist : JsonableNoTranslationKeys {
    public let id:String, name:String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
