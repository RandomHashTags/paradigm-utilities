//
//  GovernmentChamberUnitedStates.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation
import SwiftSovereignStates

public enum GovernmentChamberUnitedStates : String, CaseIterable, GovernmentChamber {
    case house
    case senate
    
    public var country : Country {
        return Country.united_states
    }
    
    public func getName() -> String {
        switch self {
        case .house: return "House"
        case .senate: return "Senate"
        }
    }
}
