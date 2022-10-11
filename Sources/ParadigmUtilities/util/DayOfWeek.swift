//
//  DayOfWeek.swift
//
//
//  Created by Evan Anderson on 6/22/22.
//

import Foundation

public enum DayOfWeek : Int, CaseIterable {
    case sunday = 1
    case monday = 2
    case tuesday = 3
    case wednesday = 4
    case thursday = 5
    case friday = 6
    case saturday = 7
    
    static func valueOf(_ value: Int) -> DayOfWeek? {
        return DayOfWeek.allCases.first(where: { value == $0.rawValue })
    }
}
