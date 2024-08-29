//
//  JOTDEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct JOTDEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public let copyright:String
    public var question:String, answer:String
    
    public init(copyright: String, question: String, answer: String) {
        self.copyright = copyright
        self.question = question
        self.answer = answer
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .copyright: return copyright
        case .question: return question
        case .answer: return answer
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .question:
            question = value as! String
            break
        case .answer:
            answer = value as! String
            break
        default:
            break
        }
    }
}

public extension JOTDEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case copyright
        case question
        case answer
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.joke_of_the_day
        }
    }
}