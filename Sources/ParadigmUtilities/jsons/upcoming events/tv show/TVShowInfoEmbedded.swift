//
//  TVShowInfoEmbedded.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

public struct TVShowInfoEmbedded : Jsonable {
    public let episodes:[TVShowEpisode]?, cast:[TVShowCast]?, akas:[TVShowAlias]?
}
