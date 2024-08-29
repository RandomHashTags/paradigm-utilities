//
//  PresentationType.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

public enum PresentationType : String, CaseIterable, Jsonable {
    case award_ceremony
    case conference
    case conference_developer
    case convention_gaming
    case exhibit_fashion
    case expo_gaming
    case event_gathering
    case festival_gaming
    case festival_music
    case presentation
    case summit
    case tournament_gaming
    
    public var name : String {
        switch self {
        case .award_ceremony: return "Award Ceremony"
        case .conference: return "Conference"
        case .conference_developer: return "Developer Conference"
        case .convention_gaming: return "Gaming Convention"
        case .exhibit_fashion: return "Fashion Exhibit"
        case .expo_gaming: return "Gaming Expo"
        case .event_gathering: return "Gathering Event"
        case .festival_gaming: return "Gaming Festival"
        case .festival_music: return  "Music Festival"
        case .presentation: return "Presentation"
        case .summit: return "Summit"
        case .tournament_gaming: return "Gaming Tournament"
        }
    }
}
