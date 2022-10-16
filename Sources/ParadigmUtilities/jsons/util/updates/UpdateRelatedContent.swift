//
//  UpdateRelatedContent.swift
//  
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation
import SwiftSovereignStates

public struct UpdateRelatedContent : Jsonable {
    public let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?, sources:EventSources?
    
    public init(countries: [Country]? = nil, subdivisions: [any SovereignStateSubdivision]? = nil, sources: EventSources? = nil) {
        self.countries = countries
        self.subdivisions = subdivisions?.map({ $0.wrapped() })
        self.sources = sources
    }
}
