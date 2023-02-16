//
//  MLBEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class MLBEvent : GenericUpcomingEvent {
    public let team_away:ClientMLBTeam, team_home:ClientMLBTeam
    
    public init(exact_start: Int64, exact_end: Int64, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, team_away: ClientMLBTeam, team_home: ClientMLBTeam) {
        self.team_away = team_away
        self.team_home = team_home
        super.init(type: UpcomingEventType.sport_mlb, event_date: nil, exact_start: exact_start, exact_end: exact_end, custom_type_singular_name: nil, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: MLBEventCodingKeys.self)
        team_away = try container.decode(ClientMLBTeam.self, forKey: .team_away)
        team_home = try container.decode(ClientMLBTeam.self, forKey: .team_home)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:MLBEventCodingKeys = key as? MLBEventCodingKeys else { return nil }
        switch key {
        case .team_away: return team_away
        case .team_home: return team_home
        }
    }
}

public enum MLBEventCodingKeys : String, UpcomingEventValueKeys {
    case team_away
    case team_home
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.mlb
    }
    public var value_type : UpcomingEventValueType {
        return UpcomingEventValueType.mlb_team
    }
}
