//
//  ScienceYearReviewEvent.swift
//  
//
//  Created by Evan Anderson on 10/17/22.
//

import Foundation

public enum ScienceYearReviewEventCodingKeys : String, UpcomingEventCodingKeys {
    case years
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.science_year_review
    }
}

public final class ScienceYearReviewEvent : GenericUpcomingEvent {
    public let years:[Int:[ClientWikipediaEvent]]
    
    public init(eventDate: EventDate!, title: String, description: String?, location: String?, imageURL: String?, years: [Int:[ClientWikipediaEvent]]) {
        self.years = years
        super.init(type: UpcomingEventType.science_year_review, event_date: eventDate, title: title, description: description, location: location, image_url: imageURL, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: ScienceYearReviewEventCodingKeys.self)
        years = try container.decode([Int:[ClientWikipediaEvent]].self, forKey: .years)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:ScienceYearReviewEventCodingKeys = key as? ScienceYearReviewEventCodingKeys else { return nil }
        switch key {
        case .years: return years
        }
    }
}
