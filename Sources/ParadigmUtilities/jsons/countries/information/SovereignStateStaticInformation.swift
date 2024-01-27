//
//  SovereignStateStaticInformation.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateStaticInformation : SovereignStateInformationValue {
    public typealias ValueKeys = SovereignStateStaticInformationValueKeys
    
    public let response_version:Int
    public var availabilities:SovereignStateAvailabilities?
    
    public var agriculture:[SovereignStateAgricultureValue]?
    public var info:[SovereignStateInfoKey]?
    public var legalities:[SovereignStateInfoKey]?
    public var rankings:[SovereignStateRankingInfoValue]?
    public var single_values:[SovereignStateSingleValue]?
    
    public var national_animals:NationalAnimals?
    public var national_anthem:NationalAnthem?
    public var national_capital:NationalCapital?
    public var national_trees:NationalTrees?
    
    public var cia_services:CIAServices?
    public var history:SovereignStateHistory?
    public var wikipedia:SovereignStateWikipedia?
    public var wikipedia_featured_pictures:WikipediaFeaturedPictures?
    
    public var sources:EventSources?
    
    public init(response_version: Int, availabilities: SovereignStateAvailabilities?, agriculture: [SovereignStateAgricultureValue]?, info: [SovereignStateInfoKey]?, legalities: [SovereignStateInfoKey]?, rankings: [SovereignStateRankingInfoValue]?, single_values: [SovereignStateSingleValue]?, national_animals: NationalAnimals?, national_anthem: NationalAnthem?, national_capital: NationalCapital?, national_trees: NationalTrees?, cia_services: CIAServices?, history: SovereignStateHistory?, wikipedia: SovereignStateWikipedia?, wikipedia_featured_pictures: WikipediaFeaturedPictures?, sources: EventSources?) {
        self.response_version = response_version
        self.availabilities = availabilities
        self.agriculture = agriculture
        self.info = info
        self.legalities = legalities
        self.rankings = rankings
        self.single_values = single_values
        self.national_animals = national_animals
        self.national_anthem = national_anthem
        self.national_capital = national_capital
        self.national_trees = national_trees
        self.cia_services = cia_services
        self.history = history
        self.wikipedia = wikipedia
        self.wikipedia_featured_pictures = wikipedia_featured_pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: SovereignStateStaticInformationValueKeys) -> Any? {
        switch key {
        case .response_version: return response_version
        case .availabilities: return availabilities
        case .agriculture: return agriculture
        case .info: return info
        case .legalities: return legalities
        case .rankings: return rankings
        case .single_values: return single_values
        case .national_animals: return national_animals
        case .national_anthem: return national_anthem
        case .national_capital: return national_capital
        case .national_trees: return national_trees
        case .cia_services: return cia_services
        case .history: return history
        case .wikipedia: return wikipedia
        case .wikipedia_featured_pictures: return wikipedia_featured_pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: SovereignStateStaticInformationValueKeys, value: T) {
        switch key {
        case .availabilities:
            availabilities = value as? SovereignStateAvailabilities
            break
        case .agriculture:
            agriculture = value as? [SovereignStateAgricultureValue]
            break
        case .info:
            info = value as? [SovereignStateInfoKey]
            break
        case .legalities:
            legalities = value as? [SovereignStateInfoKey]
            break
        case .rankings:
            rankings = value as? [SovereignStateRankingInfoValue]
            break
        case .single_values:
            single_values = value as? [SovereignStateSingleValue]
            break
        case .national_animals:
            national_animals = value as? NationalAnimals
            break
        case .national_anthem:
            national_anthem = value as? NationalAnthem
            break
        case .national_capital:
            national_capital = value as? NationalCapital
            break
        case .national_trees:
            national_trees = value as? NationalTrees
            break
        case .cia_services:
            cia_services = value as? CIAServices
            break
        case .history:
            history = value as? SovereignStateHistory
            break
        case .wikipedia:
            wikipedia = value as? SovereignStateWikipedia
            break
        case .wikipedia_featured_pictures:
            wikipedia_featured_pictures = value as? WikipediaFeaturedPictures
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum SovereignStateStaticInformationValueKeys : String, JsonableValueKeys {
    case response_version
    case availabilities
    case agriculture
    case info
    case legalities
    case rankings
    case single_values
    case national_animals
    case national_anthem
    case national_capital
    case national_trees
    case cia_services
    case history
    case wikipedia
    case wikipedia_featured_pictures
    case sources
    
    public var is_translatable : Bool {
        return self != .response_version
    }
}
