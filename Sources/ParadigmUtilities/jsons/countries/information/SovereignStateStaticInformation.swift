//
//  SovereignStateStaticInformation.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

public struct SovereignStateStaticInformation : SovereignStateInformationValue {    
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
}