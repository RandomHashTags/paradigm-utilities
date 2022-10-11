//
//  GovernmentPolicyArea.swift
//
//
//  Created by Evan Anderson on 7/21/22.
//

import Foundation

public protocol GovernmentPolicyArea : Jsonable, CaseIterable, RawRepresentable where RawValue == String {
    func getTag() -> String
}
public extension GovernmentPolicyArea {
    static func valueOf(_ string: String) -> Self? {
        return Self.allCases.first(where: { string.elementsEqual("\($0)") || string.compare($0.getTag()) == .orderedSame })
    }
}
