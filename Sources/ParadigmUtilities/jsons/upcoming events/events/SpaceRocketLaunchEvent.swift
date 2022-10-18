//
//  SpaceRocketLaunchEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public enum SpaceRocketLaunchEventCodingKeys : String, UpcomingEventCodingKeys {
    case missionName
    case missionDescription
    case missionType
    case windowStart
    case windowEnd
    case exactDay
    case exactTime
    case status
    case probability
    case videoURL
    
    public func getCategory() -> UpcomingEventValueCategory {
        return UpcomingEventValueCategory.rocket_launch
    }
    
    public func getValueType() -> UpcomingEventValueType {
        switch self {
        case .windowStart, .windowEnd:
            return UpcomingEventValueType.timestamp
        case .probability:
            return UpcomingEventValueType.placeholder
        case .videoURL:
            return UpcomingEventValueType.video_url
        default:
            return UpcomingEventValueType.defaultType()
        }
    }
    
    public func getValuePrefix() -> String? {
        switch self {
        case .missionType: return "Type: "
        case .windowStart: return "Window Start: "
        case .windowEnd: return "Window End: "
        case .exactDay: return "Exact Day: "
        case .exactTime: return "Exact Time: "
        default: return nil
        }
    }
    
    public func getValueString() -> String? {
        switch self {
        case .status:
            return "%status%%probability%"
        default:
            return nil
        }
    }
}

public final class SpaceRocketLaunchEvent : GenericUpcomingEvent {
    public let missionName:String, missionDescription:String, missionType:String, windowStart:Int64, windowEnd:Int64, exactDay:Bool?, exactTime:Bool?, status:String, probability:String, videoURL:String?
    
    public init(exactStartMilliseconds: Int64, exactEndMilliseconds: Int64, title: String, description: String?, location: String?, imageURL: String?, sources: EventSources, hyperlinks: ClientHyperlinks?, countries: [Country]?, subdivisions: [any SovereignStateSubdivision]?, mission: SpaceRocketLaunchMission) {
        missionName = mission.name
        missionDescription = mission.description
        missionType = mission.type
        windowStart = mission.windowStart
        windowEnd = mission.windowEnd
        exactDay = mission.exactDay
        exactTime = mission.exactTime
        status = mission.status
        probability = mission.probability
        videoURL = mission.videoURL
        super.init(type: UpcomingEventType.space_rocket_launch, eventDate: nil, exactStartMilliseconds: exactStartMilliseconds, exactEndMilliseconds: exactEndMilliseconds, customTypeSingularName: nil, title: title, description: description, location: location, imageURL: imageURL, youtubeVideoIDs: nil, sources: sources, hyperlinks: hyperlinks, countries: countries, subdivisions: subdivisions)
    }
    
    required init(from decoder: Decoder) throws {
        let container:KeyedDecodingContainer = try decoder.container(keyedBy: SpaceRocketLaunchEventCodingKeys.self)
        missionName = try container.decode(String.self, forKey: .missionName)
        missionDescription = try container.decode(String.self, forKey: .missionDescription)
        missionType = try container.decode(String.self, forKey: .missionType)
        windowStart = try container.decode(Int64.self, forKey: .windowStart)
        windowEnd = try container.decode(Int64.self, forKey: .windowEnd)
        exactDay = try container.decodeIfPresent(Bool.self, forKey: .exactDay)
        exactTime = try container.decodeIfPresent(Bool.self, forKey: .exactTime)
        status = try container.decode(String.self, forKey: .status)
        probability = try container.decode(String.self, forKey: .probability)
        videoURL = try container.decodeIfPresent(String.self, forKey: .videoURL)
        try super.init(from: decoder)
    }
}
