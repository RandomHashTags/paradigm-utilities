//
//  GovernmentChamberUnitedStates.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public enum GovernmentChamberUnitedStates : String, CaseIterable, GovernmentChamber {
    case house
    case senate
    
    public func getName() -> String {
        switch self {
        case .house: return "House"
        case .senate: return "Senate"
        }
    }
}
