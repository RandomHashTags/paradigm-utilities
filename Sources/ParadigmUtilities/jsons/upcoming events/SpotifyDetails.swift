//
//  SpotifyDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyDetails : JsonableNoTranslationKeys {
    public let total_tracks:Int, imageURL:String, available_markets:[String], url:String
    
    public init(total_tracks: Int, imageURL: String, available_markets: [String], url: String) {
        self.total_tracks = total_tracks
        self.imageURL = imageURL
        self.available_markets = available_markets
        self.url = url
    }
}
