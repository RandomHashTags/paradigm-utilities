//
//  SovereignStateInformationValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInformationValue : Jsonable {
    public static func == (lhs: SovereignStateInformationValue, rhs: SovereignStateInformationValue) -> Bool {
        return lhs.type == rhs.type && lhs.info == rhs.info
    }
    
    enum CodingKeys : CodingKey {
        case type
        case info
        case value
    }
    public let type:SovereignStateInformationType, info:SovereignStateInfo, value:any SovereignStateInformationValueProtocol
    
    public init(type: SovereignStateInformationType, info: SovereignStateInfo, value: any SovereignStateInformationValueProtocol) {
        self.type = type
        self.info = info
        self.value = value
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(info)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:KeyedEncodingContainer = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(info, forKey: .info)
        try container.encode(value, forKey: .value)
    }
    public init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: CodingKeys.self)
        type = try container.decode(SovereignStateInformationType.self, forKey: .type)
        let info:SovereignStateInfo = try container.decode(SovereignStateInfo.self, forKey: .info)
        let infoID:String = String(describing: info)
        let valueType:any Decodable.Type
        if infoID.starts(with: "agriculture_") {
            valueType = SovereignStateAgricultureValue.self
        } else if infoID.starts(with: "availability_") {
            valueType = ClientSovereignStateAvailability.self
        } else if infoID.starts(with: "legality_") || infoID.starts(with: "info_") {
            valueType = SovereignStateInfoKey.self
        } else if infoID.starts(with: "ranking_") {
            valueType = SovereignStateRankingInfoValue.self
        } else if infoID.starts(with: "value_") {
            valueType = SovereignStateSingleValue.self
        } else {
            throw DecodingError.typeMismatch(SovereignStateInfo.self, .init(codingPath: [CodingKeys.info], debugDescription: "test"))
        }
        value = try container.decode(valueType, forKey: .value) as! (any SovereignStateInformationValueProtocol)
        self.info = info
    }
}
