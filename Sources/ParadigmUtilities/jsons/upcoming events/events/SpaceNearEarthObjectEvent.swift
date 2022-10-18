//
//  SpaceNearEarthObjectEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum SpaceNearEarthObjectEventCodingKeys : String, UpcomingEventCodingKeys {
    case closeApproachEpoch
    case potentiallyHazardous
    case estimatedDiameterMax
    case estimatedDiameterMin
    case relativeVelocity
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.near_earth_object
    }
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .closeApproachEpoch:
            return UpcomingEventValueType.int64
        case .potentiallyHazardous:
            return UpcomingEventValueType.boolean
        case .estimatedDiameterMax, .estimatedDiameterMin:
            return UpcomingEventValueType.float
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    public func getValueTypeUnit() -> UpcomingEventValueTypeUnit? {
        switch self {
        case .estimatedDiameterMax, .estimatedDiameterMin:
            return UpcomingEventValueTypeUnit.meters
        default:
            return nil
        }
    }
    
    public func getValuePrefix() -> String? {
        switch self {
        case .relativeVelocity: return "Relative Velocity: "
        default: return nil
        }
    }
}

public final class SpaceNearEarthObjectEvent : GenericUpcomingEvent {
    public let closeApproachEpoch:Int64, potentiallyHazardous:Bool?, estimatedDiameterMax:Float, estimatedDiameterMin:Float, relativeVelocity:String
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, closeApproachEpoch: Int64, potentiallyHazardous: Bool?, estimatedDiameterMax: Float, estimatedDiameterMin: Float, relativeVelocity: String) {
        self.closeApproachEpoch = closeApproachEpoch
        self.potentiallyHazardous = potentiallyHazardous
        self.estimatedDiameterMax = estimatedDiameterMax
        self.estimatedDiameterMin = estimatedDiameterMin
        self.relativeVelocity = relativeVelocity
        super.init(type: UpcomingEventType.space_near_earth_object, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: youtubeVideoIDs, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceNearEarthObjectEventCodingKeys.self)
        closeApproachEpoch = try container.decode(Int64.self, forKey: .closeApproachEpoch)
        potentiallyHazardous = try container.decodeIfPresent(Bool.self, forKey: .potentiallyHazardous)
        estimatedDiameterMax = try container.decode(Float.self, forKey: .estimatedDiameterMax)
        estimatedDiameterMin = try container.decode(Float.self, forKey: .estimatedDiameterMin)
        relativeVelocity = try container.decode(String.self, forKey: .relativeVelocity)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:SpaceNearEarthObjectEventCodingKeys = key as? SpaceNearEarthObjectEventCodingKeys else { return nil }
        switch key {
        case .closeApproachEpoch: return closeApproachEpoch
        case .potentiallyHazardous: return potentiallyHazardous
        case .estimatedDiameterMax: return estimatedDiameterMax
        case .estimatedDiameterMin: return estimatedDiameterMin
        case .relativeVelocity: return relativeVelocity
        }
    }
}
