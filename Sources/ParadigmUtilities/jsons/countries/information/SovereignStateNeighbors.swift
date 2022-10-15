//
//  SovereignStateNeighbors.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation
import SwiftSovereignStates

public struct SovereignStateNeighbors : SovereignStateInformationValue {
    public let type: SovereignStateInformationType, info: SovereignStateInfo, neighbors:[String], sources:EventSources?
    
    public init(neighbors: [any SovereignRegion]) {
        type = .neighbors
        info = .national_anthem
        self.neighbors = neighbors.map({ $0.getCacheID() })
        sources = nil
    }
    
    public func getCountries() -> [Country]? {
        let array:[Country] = neighbors.compactMap({ Country.valueOfCacheID($0) })
        return array.isEmpty ? nil : array
    }
    public func getSubdivisions() -> [any SovereignStateSubdivision]? {
        let array:[any SovereignStateSubdivision] = neighbors.compactMap({ SovereignStateSubdivisions.valueOfCacheID($0) })
        return array.isEmpty ? nil : array
    }
    public func getCities() -> [any SovereignStateCity]? {
        let array:[any SovereignStateCity] = neighbors.compactMap({ SovereignStateCities.valueOfCacheID($0) })
        return array.isEmpty ? nil : array
    }
}
