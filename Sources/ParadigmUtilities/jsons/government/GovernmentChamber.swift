//
//  GovernmentChamber.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation
import SwiftSovereignStates

public enum GovernmentChambers {
    public static func get(_ country: Country) -> [any GovernmentChamber]? {
        switch country {
        case .united_states: return GovernmentChamberUnitedStates.allCases
        default: return nil
        }
    }
}
public extension Country {
    func valueOfGovernmentChamber(_ identifier: String) -> (any GovernmentChamber)? {
        return getGovernmentChambers()?.first(where: { $0.getIdentifier().elementsEqual(identifier) })
    }
    func getGovernmentChambers() -> [any GovernmentChamber]? {
        return GovernmentChambers.get(self)
    }
}

public protocol GovernmentChamber : Jsonable {
    func getName() -> String
}
public extension GovernmentChamber {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.getIdentifier().elementsEqual(rhs.getIdentifier())
    }
    func getIdentifier() -> String {
        return String(describing: self)
    }
}
public extension GovernmentChamber where Self : CaseIterable {
    static func valueOf(_ string: String) -> Self? {
        return Self.allCases.first(where: { string.elementsEqual("\($0)") || string.compare($0.getName()) == .orderedSame })
    }
}
