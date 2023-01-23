//
//  ServerEarthquakes.swift
//
//
//  Created by Evan Anderson on 1/7/22.
//

import Foundation

public struct ITunesDetails : Jsonable {
    public let artist_view_url:String, collection_view_url:String, amg_artist_id:Int?, image_url:String
    
    public init(artist_view_url: String, collection_view_url: String, amg_artist_id: Int?, image_url: String) {
        self.artist_view_url = artist_view_url
        self.collection_view_url = collection_view_url
        self.amg_artist_id = amg_artist_id
        self.image_url = image_url
    }
}
