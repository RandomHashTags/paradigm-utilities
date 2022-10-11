//
//  SpotifyTrack.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyTrack : Jsonable {
    public let name:String, duration:TimeInterval, artists:[String:String]?, imageURL:String?, explicit:Bool, previewURL:String?, sources:EventSources?
    
    public init(name: String, duration: TimeInterval, artists: [String : String]?, imageURL: String?, explicit: Bool, previewURL: String?, sources: EventSources?) {
        self.name = name
        self.duration = duration
        self.artists = artists
        self.imageURL = imageURL
        self.explicit = explicit
        self.previewURL = previewURL
        self.sources = sources
    }
}
