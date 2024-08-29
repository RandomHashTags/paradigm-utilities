//
//  ClientWikipediaEvent.swift
//
//
//  Created by RandomHashTags on 6/28/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientWikipediaEvent : Jsonable {    
    public let images:[String]?
    public var description:String, hyperlinks:Hyperlinks?
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?
    public var tags:[String]?, sources:EventSources?
    
    public init(images: [String]?, description: String, hyperlinks: Hyperlinks?, countries: [Country]?, subdivisions: [SovereignStateSubdivisionWrapper]?, tags: [String]?, sources: EventSources?) {
        self.images = images
        self.description = description
        self.hyperlinks = hyperlinks
        self.countries = countries
        self.subdivisions = subdivisions
        self.tags = tags
        self.sources = sources
    }
}