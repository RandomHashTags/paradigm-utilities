//
//  UpdateType.swift
//
//
//  Created by Evan Anderson on 7/28/22.
//

public enum UpdateType : String, CaseIterable, Jsonable {
    case addition
    case bug_fix
    case removal
    case performance_improvement
    case change
}
