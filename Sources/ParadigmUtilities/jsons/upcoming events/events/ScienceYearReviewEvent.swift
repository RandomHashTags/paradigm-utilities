//
//  ScienceYearReviewEvent.swift
//  
//
//  Created by Evan Anderson on 10/17/22.
//

public struct ScienceYearReviewEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
        
    public var years:[Int:[ClientWikipediaEvent]]
    
    public init(years: [Int:[ClientWikipediaEvent]]) {
        self.years = years
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .years: return years
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .years:
            years = value as! [Int:[ClientWikipediaEvent]]
            break
        }
    }
}

public extension ScienceYearReviewEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case years
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.science_year_review
        }
    }
}