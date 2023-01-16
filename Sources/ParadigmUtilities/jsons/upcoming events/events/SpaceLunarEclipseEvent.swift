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
    
    public init(exactStartMilliseconds: Int64, exactEndMilliseconds: Int64, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, timeGreatestMilliseconds: Int64, orbitalNode: String, saros: String, gamma: String, magnitudePenumbra: String, magnitudeUmbra: String, durationPartial: Int, durationTotal: Int) {
        self.timeGreatestMilliseconds = timeGreatestMilliseconds
        self.orbitalNode = orbitalNode
        self.saros = saros
        self.gamma = gamma
        self.magnitudePenumbra = magnitudePenumbra
        self.magnitudeUmbra = magnitudeUmbra
        self.durationPartial = durationPartial
        self.durationTotal = durationTotal
        super.init(type: UpcomingEventType.space_lunar_eclipse, event_date: nil, exact_start: exactStartMilliseconds, exact_end: exactEndMilliseconds, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: imageURL, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
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
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:SpaceLunarEclipseEventCodingKeys = key as? SpaceLunarEclipseEventCodingKeys else { return nil }
        switch key {
        case .timeGreatestMilliseconds: return timeGreatestMilliseconds
        case .orbitalNode: return orbitalNode
        case .saros: return saros
        case .gamma: return gamma
        case .magnitudePenumbra: return magnitudePenumbra
        case .magnitudeUmbra: return magnitudeUmbra
        case .durationPartial: return durationPartial
        case .durationTotal: return durationTotal
        }
    }
}
