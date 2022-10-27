//
//  TVShowEpisodeEmbedded.swift
//  
//
//  Created by Evan Anderson on 10/23/22.
//

import Foundation

public struct TVShowEpisodeEmbedded : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let show:TVShowInfo?
}
