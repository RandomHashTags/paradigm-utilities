//
//  ProfessionalWrestlingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class ProfessionalWrestlingEvent : GenericUpcomingEvent {
    public let main_event:String, notes:String?
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: Set<Country>?, subdivisions: [any SovereignStateSubdivision]?, main_event: String, notes: String?) {
        self.main_event = main_event
        self.notes = notes
        super.init(type: UpcomingEventType.sport_professional_wrestling, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: ProfessionalWrestlingEventValueKeys.self)
        main_event = try container.decode(String.self, forKey: .main_event)
        notes = try container.decodeIfPresent(String.self, forKey: .notes)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:ProfessionalWrestlingEventValueKeys = key as? ProfessionalWrestlingEventValueKeys else { return nil }
        switch key {
        case .main_event: return main_event
        case .notes: return notes
        }
    }
}

public enum ProfessionalWrestlingEventValueKeys : String, UpcomingEventValueKeys {
    case main_event
    case notes
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.wrestling_details
    }
}
