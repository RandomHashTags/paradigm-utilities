//
//  HistoricalEvent.swift
//  
//
//  Created by Evan Anderson on 10/13/22.
//

import Foundation

public struct HistoricalEvent : Jsonable {
    public let id:String, date:EventDate, title:String?, imageURL:String?, sources:EventSources
    
    public init(id: String, date: EventDate, title: String?, imageURL: String?, sources: EventSources) {
        self.id = id
        self.date = date
        self.title = title
        self.imageURL = imageURL
        self.sources = sources
    }
}
