//
//  EarthObservatoryImageOfTheDayEvent.swift
//  
//
//  Created by Evan Anderson on 5/22/23.
//

public struct EarthObservatoryImageOfTheDayEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.earth_observatory_image_of_the_day
    public typealias JSONKeys = NoUpcomingEventValueKeys
        
    public init() {
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        return nil
    }
}
