//
//  SovereignStateInformation.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import ZippyJSON

private enum CodingKeys : CodingKey {
    case response_version
    case administration
    case values
}

public final class SovereignStateInformation : Jsonable {
    public static func == (lhs: SovereignStateInformation, rhs: SovereignStateInformation) -> Bool {
        return lhs.response_version == rhs.response_version && lhs.administration == rhs.administration && lhs.values.count == rhs.values.count
    }
    private static func parse(decoder: ZippyJSONDecoder, info: SovereignStateInfo, data: Data) -> (any SovereignStateInformationValue)? {
        switch info {
            
        case .geography_volcanoes:
            let value:PreVolcano? = SovereignStateInformation.parse(decoder, data: data)
            return value
            
        case .national_animals:
            let value:NationalAnimals? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .national_anthem:
            let value:NationalAnthem? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .national_capital:
            let value:NationalCapital? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .national_parks:
            let value:PreNationalPark? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .national_trees:
            let value:NationalTrees? = SovereignStateInformation.parse(decoder, data: data)
            return value
            
        case .neighbors:
            let value:SovereignStateNeighbors? = SovereignStateInformation.parse(decoder, data: data)
            return value
            
        case .service_cia_values:
            let value:CIAValue? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .service_sovereign_state_history:
            let value:SovereignStateHistory? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .service_travel_advisories:
            let value:TravelAdvisory? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .service_wikipedia:
            let value:SovereignStateWikipedia? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .service_wikipedia_featured_pictures:
            let value:WikipediaFeaturedPictures? = SovereignStateInformation.parse(decoder, data: data)
            return value
            
        default:
            let id:String = info.rawValue.components(separatedBy: "_")[0]
            switch id {
            case "agriculture":
                let value:SovereignStateAgricultureValue? = SovereignStateInformation.parse(decoder, data: data)
                return value
            case "availability":
                let value:ClientSovereignStateAvailability? = SovereignStateInformation.parse(decoder, data: data)
                return value
            case "info", "legality":
                let value:SovereignStateInfoKey? = SovereignStateInformation.parse(decoder, data: data)
                return value
            case "ranking":
                let value:SovereignStateRankingInfoValue? = SovereignStateInformation.parse(decoder, data: data)
                return value
            case "value":
                let value:SovereignStateSingleValue? = SovereignStateInformation.parse(decoder, data: data)
                return value
            default:
                return nil
            }
        }
    }
    private static func parse<T: SovereignStateInformationValue>(_ decoder: ZippyJSONDecoder, data: Data) -> T? {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            return nil
        }
    }
    
    public let response_version:Int
    public let administration:ClientGovernmentAdministration
    public var values:[any SovereignStateInformationValue]
    
    public init(response_version: Int, administration: ClientGovernmentAdministration, values: [any SovereignStateInformationValue]) {
        self.response_version = response_version
        self.administration = administration
        self.values = values
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(response_version)
        hasher.combine(administration)
        for value in values {
            hasher.combine(value.type)
            hasher.combine(value.info)
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container:KeyedEncodingContainer = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(response_version, forKey: .response_version)
        try container.encode(administration, forKey: .administration)
        
        let encoder:JSONEncoder = JSONEncoder()
        let valuesData:[Data] = try values.map({ try encoder.encode($0) })
        try container.encode(valuesData, forKey: .values)
    }
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        response_version = try container.decode(Int.self, forKey: .response_version)
        administration = try container.decode(ClientGovernmentAdministration.self, forKey: .administration)
        
        let valuesData:[Data] = try container.decode([Data].self, forKey: .values)
        let decoder:ZippyJSONDecoder = ZippyJSONDecoder()
        values = try valuesData.compactMap({
            let item:SovereignStateInformationValueProtocolWrapper = try decoder.decode(SovereignStateInformationValueProtocolWrapper.self, from: $0)
            return SovereignStateInformation.parse(decoder: decoder, info: item.info, data: $0)
        })
    }
    
    private func get<T: SovereignStateInformationValue>() -> T? {
        return values.first(where: { $0 is T }) as? T
    }
    private func getAll<T: SovereignStateInformationValue>() -> [T]? {
        guard let all:[T] = values.filter({ $0 is T }) as? [T] else { return nil }
        return all.isEmpty ? nil : all
    }
    private func getAll<T: SovereignStateInformationValue>(where filter: @escaping (any SovereignStateInformationValue) -> Bool) -> [T]? {
        guard let all:[T] = values.filter(filter) as? [T] else { return nil }
        return all.isEmpty ? nil : all
    }
    
    public lazy var availabilities:[ClientSovereignStateAvailability]? = getAll(where: { $0.type == .availabilities })
    
    public lazy var nationalAnimals:NationalAnimals? = get()
    public lazy var nationalAnthem:NationalAnthem? = get()
    public lazy var nationalCapital:NationalCapital? = get()
    public lazy var nationalTrees:NationalTrees? = get()
    
    public lazy var nationalParks:[PreNationalPark]? = getAll()
    public lazy var volcanoes:[PreVolcano]? = getAll()
    
    public lazy var neighbors:SovereignStateNeighbors? = get()
    
    public lazy var agriculture:[SovereignStateAgricultureValue]? = getAll(where: { $0.type == .agriculture })
    public lazy var info:[SovereignStateInfoKey]? = getAll(where: { $0.type == .information })
    public lazy var legalities:[SovereignStateInfoKey]? = getAll(where: { $0.type == .legalities })
    public lazy var rankings:[SovereignStateRankingInfoValue]? = getAll()
    public lazy var singleValues:[SovereignStateSingleValue]? = getAll()
    
    public lazy var ciaValues:[CIAValue]? = getAll()
    public lazy var history:SovereignStateHistory? = get()
    public lazy var travelAdvisories:[TravelAdvisory]? = getAll()
    public lazy var wikipedia:SovereignStateWikipedia? = get()
    public lazy var wikipediaFeaturedPictures:WikipediaFeaturedPictures? = get()
}
