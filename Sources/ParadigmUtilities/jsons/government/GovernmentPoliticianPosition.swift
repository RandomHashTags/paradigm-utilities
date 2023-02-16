//
//  GovernmentPoliticianPosition.swift
//
//
//  Created by Evan Anderson on 9/17/22.
//

import Foundation

public enum GovernmentPoliticianPosition : String, CaseIterable, Jsonable {
    case president
    case vice_president
    
    case representative
    case senator
    
    public var abbreviation : String {
        switch self {
        case .president: return "prez"
        case .vice_president: return "viceprez"
        case .representative: return "rep"
        case .senator: return "sen"
        }
    }
    
    public static func valueOf(_ string: String) -> GovernmentPoliticianPosition? {
        return GovernmentPoliticianPosition.allCases.first(where: { $0.abbreviation.elementsEqual(string) })
    }
}
