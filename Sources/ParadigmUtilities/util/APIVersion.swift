//
//  APIVersion.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

public enum APIVersion : String, CaseIterable {
    case v1
    
    public static var latest : APIVersion { APIVersion.allCases.max(by: { $0.value > $1.value })! }
    
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
