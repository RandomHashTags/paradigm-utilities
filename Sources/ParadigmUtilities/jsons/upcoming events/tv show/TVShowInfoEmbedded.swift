//
//  TVShowInfoEmbedded.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowInfoEmbedded : JsonableNoTranslationKeys {
    public let episodes:[TVShowEpisode]?, cast:[TVShowCast]?, akas:[TVShowAlias]?
}
