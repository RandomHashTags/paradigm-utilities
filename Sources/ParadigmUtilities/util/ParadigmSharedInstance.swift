//
//  ParadigmSharedInstance.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation
import SwiftSovereignStates

public protocol ParadigmSharedInstance {
    static var shared_identifier : ParadigmSharedInstanceIdentifier { get }
    init()
}

public extension ParadigmSharedInstance {
    static var shared : Self {
        return get(identifier: shared_identifier)
    }
    static func get<T : ParadigmSharedInstance>(identifier: ParadigmSharedInstanceIdentifier) -> T {
        return ParadigmCache.get_shared_instances_cache().get_or_insert(identifier) {
            return T.init()
        } as! T
    }
    
    static func remove(identifier: ParadigmSharedInstanceIdentifier) {
        ParadigmCache.get_shared_instances_cache().remove_value(for_key: identifier)
    }
    func remove() {
        ParadigmCache.get_shared_instances_cache().remove_value(for_key: Self.shared_identifier)
    }
}

public enum ParadigmSharedInstanceIdentifier : Hashable {
    case async_task
    case custom(AnyHashable)
    
    #if os(macOS) || os(Linux)
    /*
     Server-side
     */
    case timings
    case server(TargetServer)
    
    case country_availabilities
    case country_service(SovereignStateInfo)
    
    case government_administration_country(Country)
    case government_administration_subdivision(SovereignStateSubdivisionWrapper)
    case government_politicians_country(Country)
    case government_politicians_subdivision(SovereignStateSubdivisionWrapper)
    
    case service_rotten_tomatoes
    case service_spotify
    
    case upcoming_events_movie_production_companies
    
    case weather_alerts
    case weather_controller(Country)
    case weather_earthquakes
    case weather_nasa_eonet
    #endif
}
