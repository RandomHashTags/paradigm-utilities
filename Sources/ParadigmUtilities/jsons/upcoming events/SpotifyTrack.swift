//
//  SpotifyTrack.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct SpotifyTrack : Jsonable {
    let name:String, duration:TimeInterval, artists:[String:String]?, imageURL:String?, explicit:Bool, previewURL:String?, sources:EventSources?
}
