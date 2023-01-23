//
//  ScienceYearReviewEvent.swift
//  
//
//  Created by Evan Anderson on 10/17/22.
//

import Foundation

public final class ScienceYearReviewEvent : GenericUpcomingEvent {
    public let years:[Int:[ClientWikipediaEvent]]
    
    public init(event_date: EventDate!, title: String, description: String?, location: String?, image_url: String?, years: [Int:[ClientWikipediaEvent]]) {
        self.years = years
        super.init(type: UpcomingEventType.science_year_review, event_date: event_date, title: title, description: description, location: location, image_url: image_url, sources: EventSources(sources: []), hyperlinks: nil, countries: nil, subdivisions: nil)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: ScienceYearReviewEventValueKeys.self)
        years = try container.decode([Int:[ClientWikipediaEvent]].self, forKey: .years)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:ScienceYearReviewEventValueKeys = key as? ScienceYearReviewEventValueKeys else { return nil }
        switch key {
        case .years: return years
        }
    }
}

public enum ScienceYearReviewEventValueKeys : String, UpcomingEventValueKeys {
    case years
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.science_year_review
    }
}
