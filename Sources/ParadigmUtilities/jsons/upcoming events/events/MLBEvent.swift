//
//  MLBEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum MLBEventCodingKeys : String, UpcomingEventCodingKeys {
    case teamAway
    case teamHome
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.mlb
    }
    public func getValueType() -> UpcomingEventValueType {
        return UpcomingEventValueType.mlb_team
    }
}

public final class MLBEvent : GenericUpcomingEvent {
    public let teamAway:ClientMLBTeam, teamHome:ClientMLBTeam
    
    public init(exactStartMilliseconds: Int64, exactEndMilliseconds: Int64, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, teamAway: ClientMLBTeam, teamHome: ClientMLBTeam) {
        self.teamAway = teamAway
        self.teamHome = teamHome
        super.init(type: UpcomingEventType.sport_mlb, eventDate: nil, exactStartMilliseconds: exactStartMilliseconds, exactEndMilliseconds: exactEndMilliseconds, customTypeSingularName: nil, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MLBEventCodingKeys.self)
        teamAway = try container.decode(ClientMLBTeam.self, forKey: .teamAway)
        teamHome = try container.decode(ClientMLBTeam.self, forKey: .teamHome)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:MLBEventCodingKeys = key as? MLBEventCodingKeys else { return nil }
        switch key {
        case .teamAway: return teamAway
        case .teamHome: return teamHome
        }
    }
}
