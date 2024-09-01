//
//  CountryGovernmentRecentActivity.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import SwiftSovereignStates

// MARK: Activity
public extension Responses.Government {
    public struct CountryGovernmentRecentActivity : Jsonable {    
        public let country:Country
        public var activity:[Chamber]
        
        public init(country: Country, activity: [Chamber]) {
            self.country = country
            self.activity = activity
        }
    }
}

// MARK: Bill Status
public extension Responses.Government.CountryGovernmentRecentActivity {
    struct BillStatus : Jsonable {        
        public let status:GovernmentBillStatusWrapper
        public var dates:[Date]
        
        public init(status: any GovernmentBillStatus, dates: [Date]) {
            self.status = status.wrapped()
            self.dates = dates
        }
    }
}

// MARK: Chamber
public extension Responses.Government.CountryGovernmentRecentActivity {
    struct Chamber : Jsonable {        
        public let chamber:GovernmentChamberWrapper
        public var dates:[Date]
        
        public init(chamber: GovernmentChamberWrapper, dates: [Date]) {
            self.chamber = chamber
            self.dates = dates
        }
    }
}

// MARK: Date
public extension Responses.Government.CountryGovernmentRecentActivity {
    struct Date : Jsonable {        
        public let date:EventDate
        public var activity:[GovernmentPreAdministrationBill]
        
        public init(date: EventDate, activity: [GovernmentPreAdministrationBill]) {
            self.date = date
            self.activity = activity
        }
    }
}