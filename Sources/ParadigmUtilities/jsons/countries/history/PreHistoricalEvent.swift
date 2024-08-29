//
//  PreHistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 1/23/23.
//

import Foundation

public struct PreHistoricalEvent : Jsonable {    
    public let id:String, date:EventDate
    public let exact_time_start:Int64?, exact_time_end:Int64?
    public var name:String, summary:String
    public let image_url:String?
    
    public init(id: String, date: EventDate, exact_time_start: Int64?, exact_time_end: Int64?, name: String, summary: String, image_url: String?) {
        self.id = id
        self.date = date
        self.exact_time_start = exact_time_start
        self.exact_time_end = exact_time_end
        self.name = name
        self.summary = summary
        self.image_url = image_url
    }
}