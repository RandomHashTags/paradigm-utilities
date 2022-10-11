//
//  Language.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation

public enum Language : String, CaseIterable {
    case arabic = "ar"
    case azerbaijani = "az"
    case bengali = "bn"
    case bulgarian = "bg"
    case chinese = "zh"
    case czech = "cs"
    case danish = "da"
    case dutch = "nl"
    case english = "en"
    case finnish = "fi"
    case french = "fr"
    case german = "de"
    case greek = "el"
    case hindi = "hi"
    case hungarian = "hu"
    case indonesian = "id"
    case irish = "ga"
    case italian = "it"
    case japanese = "ja"
    case korean = "ko"
    case latin = "la"
    case persian = "fa"
    case polish = "pl"
    case portuguese = "pt"
    case punjabi = "pa"
    case russian = "ru"
    case slovak = "sk"
    case spanish = "es"
    case swahili = "sw"
    case swedish = "sv"
    case turkish = "tr"
    case ukrainian = "uk"
    case urdu = "ur"
    case vietnamese = "vi"
    case welsh = "cy"
    
    public static func valueOf(_ string: String?) -> Language? {
        guard let string:String = string else { return nil }
        return Language.allCases.first(where: { string.compare("\($0)") == .orderedSame || string.compare($0.rawValue) == .orderedSame })
    }
}
