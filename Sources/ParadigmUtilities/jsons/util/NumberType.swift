//
//  NumberType.swift
//
//
//  Created by Evan Anderson on 6/25/22.
//

import Foundation

public enum NumberType : String, CaseIterable, Jsonable {
    case integer
    case double
    case float
    case long
    
    public static func valueOf(_ string: String) -> NumberType? {
        return NumberType.allCases.first(where: { string.elementsEqual("\($0)") })
    }
}
