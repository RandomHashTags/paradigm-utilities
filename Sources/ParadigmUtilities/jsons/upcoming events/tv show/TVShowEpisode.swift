//
//  TVShowEpisode.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public final class TVShowEpisode : JsonableNoTranslationKeys {
    public static func == (lhs: TVShowEpisode, rhs: TVShowEpisode) -> Bool {
        return lhs.id == rhs.id
    }
    
    public let id:Int, name:String, season:Int, number:Int?, runtime:Int?, summary:String?, image:TVShowImage?, airstamp:String, airdate:String, airtime:String
    public let _embedded:TVShowEpisodeEmbedded?
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
