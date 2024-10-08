//
//  SemanticVersion.swift
//
//
//  Created by Evan Anderson on 7/19/22.
//

public struct SemanticVersion : Jsonable, Comparable {
    public static func < (lhs: SemanticVersion, rhs: SemanticVersion) -> Bool {
        let leftMajor:Int = lhs.major, rightMajor:Int = rhs.major
        let leftMinor:Int = lhs.minor, rightMinor:Int = rhs.minor
        let leftPatch:Int = lhs.patch, rightPatch:Int = rhs.patch
        return leftMajor < rightMajor || leftMajor == rightMajor && (leftMinor < rightMinor || leftMinor == rightMinor && leftPatch < rightPatch)
    }
    
    public let major:Int, minor:Int, patch:Int
    
    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }
    public init(string: String) {
        let values:[Substring] = string.split(separator: ".")
        major = values[0].parse_int ?? 0
        minor = values[1].parse_int ?? 0
        patch = values[2].parse_int ?? 0
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(description)
    }
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let string:String = try container.decode(String.self)
        self = SemanticVersion(string: string)
    }
    
    public var description : String { "\(major).\(minor).\(patch)" }
}
