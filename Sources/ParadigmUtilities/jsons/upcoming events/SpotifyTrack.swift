//
//  SpotifyTrack.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

// MARK: Track
public struct SpotifyTrack : Jsonable {    
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
}

// MARK: Artist
public struct SpotifyArtist : Jsonable {
    public let id:String, name:String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
