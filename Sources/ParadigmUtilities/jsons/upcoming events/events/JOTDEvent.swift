//
//  JOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum JOTDEventCodingKeys : String, UpcomingEventCodingKeys {
    case copyright
    case question
    case answer
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.joke_of_the_day
    }
}

public final class JOTDEvent : GenericUpcomingEvent {
    public let copyright:String, question:String, answer:String
    
    public init(eventDate: EventDate, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, copyright: String, question: String, answer: String) {
        self.copyright = copyright
        self.question = question
        self.answer = answer
        super.init(type: UpcomingEventType.joke_of_the_day, eventDate: eventDate, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    public required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: JOTDEventCodingKeys.self)
        copyright = try container.decode(String.self, forKey: .copyright)
        question = try container.decode(String.self, forKey: .question)
        answer = try container.decode(String.self, forKey: .answer)
        try super.init(from: decoder)
    }
    
    public override func getValue(_ key: any UpcomingEventCodingKeys) -> Any? {
        guard let key:JOTDEventCodingKeys = key as? JOTDEventCodingKeys else { return nil }
        switch key {
        case .copyright: return copyright
        case .question: return question
        case .answer: return answer
        }
    }
}
