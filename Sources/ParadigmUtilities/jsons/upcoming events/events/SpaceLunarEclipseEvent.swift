//
//  SpaceLunarEclipseEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum SpaceLunarEclipseEventCodingKeys : String, UpcomingEventCodingKeys {
    case timeGreatestMilliseconds
    case orbitalNode
    case saros
    case gamma
    case magnitudePenumbra
    case magnitudeUmbra
    case durationPartial
    case durationTotal
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.space_lunar_eclipse
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .timeGreatestMilliseconds:
            return UpcomingEventValueType.timestamp
        case .durationPartial, .durationTotal:
            return UpcomingEventValueType.int
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
}

public final class SpaceLunarEclipseEvent : GenericUpcomingEvent {
    public let timeGreatestMilliseconds:Int64, orbitalNode:String, saros:String, gamma:String, magnitudePenumbra:String, magnitudeUmbra:String, durationPartial:Int, durationTotal:Int
    
    public init(exactStartMilliseconds: Int64, exactEndMilliseconds: Int64, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, timeGreatestMilliseconds: Int64, orbitalNode: String, saros: String, gamma: String, magnitudePenumbra: String, magnitudeUmbra: String, durationPartial: Int, durationTotal: Int) {
        self.timeGreatestMilliseconds = timeGreatestMilliseconds
        self.orbitalNode = orbitalNode
        self.saros = saros
        self.gamma = gamma
        self.magnitudePenumbra = magnitudePenumbra
        self.magnitudeUmbra = magnitudeUmbra
        self.durationPartial = durationPartial
        self.durationTotal = durationTotal
        super.init(type: UpcomingEventType.space_lunar_eclipse, eventDate: nil, exactStartMilliseconds: exactStartMilliseconds, exactEndMilliseconds: exactEndMilliseconds, customTypeSingularName: nil, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceLunarEclipseEventCodingKeys.self)
        timeGreatestMilliseconds = try container.decode(Int64.self, forKey: .timeGreatestMilliseconds)
        orbitalNode = try container.decode(String.self, forKey: .orbitalNode)
        saros = try container.decode(String.self, forKey: .saros)
        gamma = try container.decode(String.self, forKey: .gamma)
        magnitudePenumbra = try container.decode(String.self, forKey: .magnitudePenumbra)
        magnitudeUmbra = try container.decode(String.self, forKey: .magnitudeUmbra)
        durationPartial = try container.decode(Int.self, forKey: .durationPartial)
        durationTotal = try container.decode(Int.self, forKey: .durationTotal)
        try super.init(from: decoder)
    }
}
