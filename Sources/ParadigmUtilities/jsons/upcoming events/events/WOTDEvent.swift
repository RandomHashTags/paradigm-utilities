//
//  WOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct WOTDEvent : UpcomingEventData {
    public static let event_type:UpcomingEventType = UpcomingEventType.word_of_the_day
    public typealias JSONKeys = ValueKeys
    
    public var examples:[String]?
    public let pronunciation_url:String?, syllables:String, grammar_type:String
    
    public init(examples: [String]?, pronunciation_url: String?, syllables: String, grammar_type: String) {
        self.examples = examples
        self.pronunciation_url = pronunciation_url
        self.syllables = syllables
        self.grammar_type = grammar_type
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .examples: return examples
        case .pronunciation_url: return pronunciation_url
        case .syllables: return syllables
        case .grammar_type: return grammar_type
        }
    }
}

public extension WOTDEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case examples
        case pronunciation_url
        case syllables
        case grammar_type
        
        public var category : UpcomingEventValueCategory {
            switch self {
            case .examples:
                return UpcomingEventValueCategory.word_of_the_day_post_details
            default:
                return UpcomingEventValueCategory.word_of_the_day_details
            }
        }
        
        public var value_cell_type : UpcomingEventValueCellType {
            switch self {
            case .pronunciation_url:
                return UpcomingEventValueCellType.audio
            default:
                return UpcomingEventValueCellType.label
            }
        }
        public var value_prefix : String? {
            switch self {
            case .examples: return "Examples:\n\n"
            case .syllables: return "Syllables: "
            case .grammar_type: return "Type: "
            default: return nil
            }
        }
    }
}