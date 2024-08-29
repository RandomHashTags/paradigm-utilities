//
//  SubdivisionEarthquakes.swift
//  
//
//  Created by Evan Anderson on 1/21/23.
//

import SwiftSovereignStates

public struct SubdivisionEarthquakes : Jsonable {    
    public let subdivision:SovereignStateSubdivisionWrapper?
    public var magnitudes:[PreEarthquakeMagnitude]
    
    public init(subdivision: (any SovereignStateSubdivision)?, magnitudes: [PreEarthquakeMagnitude]) {
        self.subdivision = subdivision?.wrapped()
        self.magnitudes = magnitudes
    }
}