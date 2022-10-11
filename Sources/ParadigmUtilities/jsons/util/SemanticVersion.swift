//
//  SemanticVersion.swift
//
//
//  Created by Evan Anderson on 7/19/22.
//

import Foundation

public struct SemanticVersion : Codable, Hashable, Comparable {
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        let leftMajor:Int = lhs.major, rightMajor:Int = rhs.major
        let leftMinor:Int = lhs.minor, rightMinor:Int = rhs.minor
        let leftPatch:Int = lhs.patch, rightPatch:Int = rhs.patch
        return leftMajor < rightMajor || leftMajor == rightMajor && (leftMinor < rightMinor || leftMinor == rightMinor && leftPatch < rightPatch)
    }
    
    let major:Int, minor:Int, patch:Int
    
    init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }
    init(string: String) {
        let values:[String] = string.components(separatedBy: ".")
        major = Int(values[0])!
        minor = Int(values[1])!
        patch = Int(values[2])!
    }
    
    func toString() -> String {
        return major.description + "." + minor.description + "." + patch.description
    }
}
