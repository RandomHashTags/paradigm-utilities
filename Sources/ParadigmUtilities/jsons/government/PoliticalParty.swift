//
//  PoliticalParty.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public enum PoliticalParty : String, CaseIterable, Jsonable {
    case democrat
    case independent
    case libertarian
    case republican
    
    case democratic_republican
    case federalist
    case whig
    
    case no_party
    case unknown
    
    public static func valueOf(_ string: String) -> PoliticalParty {
        return PoliticalParty.allCases.first(where: {
            guard string.compare("\($0)") == .orderedSame || string.compare($0.abbreviation) == .orderedSame || string.compare($0.name) == .orderedSame else {
                let stringLowercase:String = string.lowercased()
                return $0.aliases.contains(stringLowercase)
            }
            return true
        }) ?? PoliticalParty.unknown
    }
    
    public var name : String {
        switch self {
        case .democrat: return "Democrat"
        case .independent: return "Independent"
        case .libertarian: return "Libertarian"
        case .republican: return "Republican"
            
        case .democratic_republican: return "Democratic-Republican"
        case .federalist: return "Federalist"
        case .whig: return "Whig"
            
        case .no_party: return "No Party"
        case .unknown: return "Unknown"
        }
    }
    public var aliases : Set<String> {
        switch self {
        case .democrat: return ["Democratic"]
        case .republican: return ["GOP"]
        default: return []
        }
    }
    public var abbreviation : String {
        switch self {
        case .democrat: return "D"
        case .independent: return "I"
        case .libertarian: return "L"
        case .republican: return "R"
            
        case .democratic_republican: return "DR"
        case .federalist: return "F"
        case .whig: return "W"
            
        case .no_party: return "NONE"
        case .unknown: return "?"
        }
    }
}
