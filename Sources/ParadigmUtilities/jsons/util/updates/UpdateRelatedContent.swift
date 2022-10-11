//
//  UpdateRelatedContent.swift
//  
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation
import SwiftSovereignStates

public struct UpdateRelatedContent : Jsonable {
    let countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?, sources:EventSources?
    
    init(countries: [Country]? = nil, subdivisions: [any SovereignStateSubdivision]? = nil, sources: EventSources? = nil) {
        self.countries = countries
        self.subdivisions = subdivisions?.map({ SovereignStateSubdivisionWrapper($0) })
        self.sources = sources
    }
}
