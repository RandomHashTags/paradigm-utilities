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
    case values
}

public struct SovereignStateInformation : Jsonable {
    public static func == (lhs: SovereignStateInformation, rhs: SovereignStateInformation) -> Bool {
        return lhs.hashValue == rhs.hashValue
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
            
        case .service_cia_values:
            let value:CIAValue? = SovereignStateInformation.parse(decoder, data: data)
            return value
        case .service_travel_advisories:
            let value:TravelAdvisory? = SovereignStateInformation.parse(decoder, data: data)
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
    
    public let response_version:Int, values:[any SovereignStateInformationValue]
    
    public init(response_version: Int, values: [any SovereignStateInformationValue]) {
        self.response_version = response_version
        self.values = values
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(response_version)
        for value in values {
            hasher.combine(value.type)
            hasher.combine(value.info)
        }
    }
    public func encode(to encoder: Encoder) throws {
        var valuesString:String = ""
        for value in values {
            let data:Data = try JSONEncoder().encode(value)
            let string:String = (valuesString.isEmpty ? "" : ",") + String(data: data, encoding: .utf8)!
            valuesString.append(string)
        }
        let string:String = "{\"response_version\":" + response_version.description + ",\"values\":[" + valuesString + "]}"
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(string)
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        response_version = Int(string.components(separatedBy: "\"response_version\":")[1].components(separatedBy: ",")[0])!
        var values:[any SovereignStateInformationValue] = [any SovereignStateInformationValue]()
        var valuesString:String = string.components(separatedBy: ",\"values\":[")[1]
        valuesString = valuesString.prefix(valuesString.count-2).description
        let valuesArray:[String] = valuesString.components(separatedBy: "},{")
        var index:Int = 0
        let decoder:ZippyJSONDecoder = ZippyJSONDecoder()
        for var valueString in valuesArray {
            valueString = (index != 0 ? "{" : "") + valueString + (index == 0 ? "}" : "")
            if let data:Data = valueString.data(using: .utf8) {
                let item:SovereignStateInformationValueProtocolWrapper = try decoder.decode(SovereignStateInformationValueProtocolWrapper.self, from: data)
                if let value:any SovereignStateInformationValue = SovereignStateInformation.parse(decoder: decoder, info: item.info, data: data) {
                    values.append(value)
                }
            }
            index += 1
        }
        self.values = values
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
    
    public func getNationalAnimals() -> NationalAnimals? {
        return get()
    }
    public func getNationalAnthem() -> NationalAnthem? {
        return get()
    }
    public func getNationalCapital() -> NationalCapital? {
        return get()
    }
    public func getNationalTrees() -> NationalTrees? {
        return get()
    }
    
    public func getNationalParks() -> [PreNationalPark]? {
        return getAll()
    }
    public func getVolcanoes() -> [PreVolcano]? {
        return getAll()
    }
    
    public func getAgriculture() -> [SovereignStateAgricultureValue]? {
        return getAll(where: { $0.type == .agriculture })
    }
    public func getInfo() -> [SovereignStateInfoKey]? {
        return getAll(where: { $0.type == .information })
    }
    public func getLegalities() -> [SovereignStateInfoKey]? {
        return getAll(where: { $0.type == .legalities })
    }
    public func getRankings() -> [SovereignStateRankingInfoValue]? {
        return getAll()
    }
    public func getSingleValues() -> [SovereignStateSingleValue]? {
        return getAll()
    }
    
    public func getCIAValues() -> [CIAValue]? {
        return getAll()
    }
    public func getTravelAdvisories() -> [TravelAdvisory]? {
        return getAll()
    }
}
