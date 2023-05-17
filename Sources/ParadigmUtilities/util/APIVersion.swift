//
//  APIVersion.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation

public enum APIVersion : String, CaseIterable {
    case v1
    
    public static var latest : APIVersion {
        return APIVersion.allCases.max(by: { $0.value > $1.value })!
    }
    
    public var value : Int {
        switch self {
        case .v1: return 1
        }
    }
    
    public var is_shutdown : Bool {
        switch self {
        case .v1:
            return false
        }
    }
}
