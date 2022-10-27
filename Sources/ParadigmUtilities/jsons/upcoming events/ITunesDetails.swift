//
//  ServerEarthquakes.swift
//
//
//  Created by Evan Anderson on 1/7/22.
//

import Foundation

public struct ITunesDetails : JsonableNoTranslationKeys {
    public let artistViewUrl:String, collectionViewUrl:String, amgArtistId:Int?, imageURL:String
    
    public init(artistViewUrl: String, collectionViewUrl: String, amgArtistId: Int?, imageURL: String) {
        self.artistViewUrl = artistViewUrl
        self.collectionViewUrl = collectionViewUrl
        self.amgArtistId = amgArtistId
        self.imageURL = imageURL
    }
}
