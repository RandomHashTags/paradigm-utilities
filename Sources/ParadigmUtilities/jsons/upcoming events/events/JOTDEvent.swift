//
//  JOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public final class JOTDEvent : GenericUpcomingEvent {
    public let copyright:String, question:String, answer:String
    
    public init(event_date: EventDate, title: String, description: String?, location: String?, image_url: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, copyright: String, question: String, answer: String) {
        self.copyright = copyright
        self.question = question
        self.answer = answer
        super.init(type: UpcomingEventType.joke_of_the_day, event_date: event_date, title: title, description: description, location: location, image_url: image_url, youtube_video_ids: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: JOTDEventValueKeys.self)
        copyright = try container.decode(String.self, forKey: .copyright)
        question = try container.decode(String.self, forKey: .question)
        answer = try container.decode(String.self, forKey: .answer)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventValueKeys) -> Any? {
        guard let key:JOTDEventValueKeys = key as? JOTDEventValueKeys else { return nil }
        switch key {
        case .copyright: return copyright
        case .question: return question
        case .answer: return answer
        }
    }
}

public enum JOTDEventValueKeys : String, UpcomingEventValueKeys {
    case copyright
    case question
    case answer
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.joke_of_the_day
    }
}
