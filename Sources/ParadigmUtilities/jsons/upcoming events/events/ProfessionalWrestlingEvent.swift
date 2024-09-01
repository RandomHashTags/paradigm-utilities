//
//  ProfessionalWrestlingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct ProfessionalWrestlingEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.sport_professional_wrestling
    public typealias JSONKeys = ValueKeys
    
    public var main_event:String, notes:String?
    
    public init(main_event: String, notes: String?) {
        self.main_event = main_event
        self.notes = notes
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .main_event: return main_event
        case .notes: return notes
        }
    }
}

public extension ProfessionalWrestlingEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case main_event
        case notes
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.wrestling_details
        }
    }
}