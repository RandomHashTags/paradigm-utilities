//
//  GovernmentChamber.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

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
