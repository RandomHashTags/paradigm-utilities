//
//  SpotifyDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

public struct SpotifyDetails : Jsonable {
    public let total_tracks:Int, image_url:String, available_markets:[String], url:String
    
    public init(total_tracks: Int, image_url: String, available_markets: [String], url: String) {
        self.total_tracks = total_tracks
        self.image_url = image_url
        self.available_markets = available_markets
        self.url = url
    }
}
