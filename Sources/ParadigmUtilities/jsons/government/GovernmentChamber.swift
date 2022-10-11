//
//  GovernmentChamber.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

protocol GovernmentChamber : Jsonable, CaseIterable, RawRepresentable where RawValue == String {
    func getName() -> String
}
extension GovernmentChamber {
    static func valueOf(_ string: String) -> Self? {
        return Self.allCases.first(where: { string.elementsEqual("\($0)") || string.compare($0.getName()) == .orderedSame })
    }
}
