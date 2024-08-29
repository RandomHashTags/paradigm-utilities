//
//  TVShowEpisode.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

public struct TVShowEpisode : Jsonable {
    public let id:Int, name:String, season:Int, number:Int?, runtime:Int?, summary:String?, image:TVShowImage?, airstamp:String, airdate:String, airtime:String
    public let _embedded:TVShowEpisodeEmbedded?
}
