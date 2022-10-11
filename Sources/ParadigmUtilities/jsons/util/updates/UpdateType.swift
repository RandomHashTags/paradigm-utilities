//
//  UpdateType.swift
//
//
//  Created by Evan Anderson on 7/28/22.
//

import Foundation

public enum UpdateType : String, CaseIterable, Codable {
    case addition
    case bug_fix
    case removal
    case performance_improvement
    case change
    
    static func valueOf(_ string: String?) -> UpdateType? {
        guard let string:String = string else { return nil }
        return UpdateType.allCases.first(where: { string.elementsEqual("\($0)") })
    }
}
