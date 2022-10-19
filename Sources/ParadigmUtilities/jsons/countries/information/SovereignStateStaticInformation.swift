//
//  SovereignStateStaticInformation.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct SovereignStateStaticInformation : SovereignStateInformationValue {
    public let availabilities:SovereignStateAvailabilities?
    
    public let agriculture:[SovereignStateAgricultureValue]?
    public let info:[SovereignStateInfoKey]?
    public let legalities:[SovereignStateInfoKey]?
    public var rankings:[SovereignStateRankingInfoValue]?
    public let single_values:[SovereignStateSingleValue]?
    
    public let national_animals:NationalAnimals?
    public let national_anthem:NationalAnthem?
    public let national_capital:NationalCapital?
    public let national_trees:NationalTrees?
    
    public let cia_values:[CIAValue]?
    public let history:SovereignStateHistory?
    public let wikipedia:SovereignStateWikipedia?
    public let wikipedia_featured_pictures:WikipediaFeaturedPictures?
    
    public let national_parks:[PreNationalPark]?
    public let volcanoes:[PreVolcano]?
    
    public let sources:EventSources?
    
    public init(availabilities: SovereignStateAvailabilities?, agriculture: [SovereignStateAgricultureValue]?, info: [SovereignStateInfoKey]?, legalities: [SovereignStateInfoKey]?, rankings: [SovereignStateRankingInfoValue]?, single_values: [SovereignStateSingleValue]?, national_animals: NationalAnimals?, national_anthem: NationalAnthem?, national_capital: NationalCapital?, national_trees: NationalTrees?, cia_values: [CIAValue]?, history: SovereignStateHistory?, wikipedia: SovereignStateWikipedia?, wikipedia_featured_pictures: WikipediaFeaturedPictures?, national_parks: [PreNationalPark]?, volcanoes: [PreVolcano]?, sources: EventSources?) {
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
        self.cia_values = cia_values
        self.history = history
        self.wikipedia = wikipedia
        self.wikipedia_featured_pictures = wikipedia_featured_pictures
        self.national_parks = national_parks
        self.volcanoes = volcanoes
        self.sources = sources
    }
}
