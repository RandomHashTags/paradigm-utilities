//
//  SpotifyDetails.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyDetails : Jsonable {
    public let total_tracks:Int, imageURL:String, available_markets:[String], url:String
}
