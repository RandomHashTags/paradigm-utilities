//
//  ProfessionalWrestlingEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct ProfessionalWrestlingEvent : Jsonable {
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
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .main_event:
            main_event = value as! String
            break
        case .notes:
            notes = value as? String
            break
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