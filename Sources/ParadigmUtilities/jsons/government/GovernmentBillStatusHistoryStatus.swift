//
//  GovernmentBillStatusHistoryStatus.swift
//
//
//  Created by Evan Anderson on 7/22/22.
//

import Foundation

public protocol GovernmentBillStatusHistoryStatus : CaseIterable, RawRepresentable where RawValue == String  {
    func getName() -> String
}
public extension GovernmentBillStatusHistoryStatus {
    static func valueOf(_ string: String?) -> Self? {
        guard let string:String = string else { return nil }
        return Self.allCases.first(where: { string.compare("\($0)") == .orderedSame || string.compare($0.getName()) == .orderedSame || string.lowercased().starts(with: $0.getName().lowercased()) })
    }
}
