//
//  ProfessionalWrestlingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum ProfessionalWrestlingEventCodingKeys : String, UpcomingEventCodingKeys {
    case mainEvent
    case notes
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.wrestling_details
    }
}

public final class ProfessionalWrestlingEvent : GenericUpcomingEvent {
    public let mainEvent:String, notes:String?
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, youtubeVideoIDs: [String]?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, mainEvent: String, notes: String?) {
        self.mainEvent = mainEvent
        self.notes = notes
        super.init(type: UpcomingEventType.sport_professional_wrestling, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: youtubeVideoIDs, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: ProfessionalWrestlingEventCodingKeys.self)
        mainEvent = try container.decode(String.self, forKey: .mainEvent)
        notes = try container.decodeIfPresent(String.self, forKey: .notes)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:ProfessionalWrestlingEventCodingKeys = key as? ProfessionalWrestlingEventCodingKeys else { return nil }
        switch key {
        case .mainEvent: return mainEvent
        case .notes: return notes
        }
    }
}
