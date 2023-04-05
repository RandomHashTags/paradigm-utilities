//
//  ExactFloat.swift
//  
//
//  Created by Evan Anderson on 4/5/23.
//

import Foundation

public struct ExactFloat : Hashable, Codable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral, Comparable {
    public typealias IntegerLiteralType = Int
    public typealias FloatLiteralType = Float
    
    public var value:Float
    
    public init(_ value: Float) {
        self.value = value
    }
    public init(_ value: any BinaryInteger) {
        self.value = Float(value)
    }
    
    public init(floatLiteral value: Float) {
        self.value = value
    }
    public init(integerLiteral value: Int) {
        self.value = Float(value)
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        if let string:String = try? container.decode(String.self) {
            value = Float(string) ?? 0
        } else {
            value = try container.decode(Float.self)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(String(describing: value))
    }
    
    public static func < (lhs: ExactFloat, rhs: ExactFloat) -> Bool {
        return lhs.value < rhs.value
    }
    public static func < (lhs: ExactFloat, rhs: Float) -> Bool {
        return lhs.value < rhs
    }
    public static func < (lhs: ExactFloat, rhs: any BinaryInteger) -> Bool {
        return lhs.value < Float(rhs)
    }
    
    public static func * (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value * right.value)
    }
    public static func * (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value * right)
    }
    public static func * (left: ExactFloat, right: any BinaryInteger) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value * Float(right))
    }
    
    public static func / (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value / right.value)
    }
    public static func / (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value / right)
    }
    public static func / (left: ExactFloat, right: any BinaryInteger) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value / Float(right))
    }
    
    public static func + (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value + right.value)
    }
    public static func + (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value + right)
    }
    public static func + (left: ExactFloat, right: any BinaryInteger) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value + Float(right))
    }
    
    public static func - (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value - right.value)
    }
    public static func - (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value - right)
    }
    public static func - (left: ExactFloat, right: any BinaryInteger) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value - Float(right))
    }
}
public extension Float {
    static func == (lhs: Float, rhs: ExactFloat) -> Bool {
        return lhs == rhs.value
    }
    static func <= (lhs: Float, rhs: ExactFloat) -> Bool {
        return lhs <= rhs.value
    }
    static func >= (lhs: Float, rhs: ExactFloat) -> Bool {
        return lhs >= rhs.value
    }
    
    static func < (lhs: Float, rhs: ExactFloat) -> Bool {
        return lhs < rhs.value
    }
    static func > (lhs: Float, rhs: ExactFloat) -> Bool {
        return lhs > rhs.value
    }
    
    static func * (left: Float, right: ExactFloat) -> Float {
        return left * right.value
    }
    
    static func / (left: Float, right: ExactFloat) -> Float {
        return left / right.value
    }
    
    static func + (left: Float, right: ExactFloat) -> Float {
        return left + right.value
    }
    
    static func - (left: Float, right: ExactFloat) -> Float {
        return left - right.value
    }
}
public extension Int {
    static func == (lhs: Int, rhs: ExactFloat) -> Bool {
        return Float(lhs) == rhs.value
    }
    static func <= (lhs: Int, rhs: ExactFloat) -> Bool {
        return Float(lhs) <= rhs.value
    }
    static func >= (lhs: Int, rhs: ExactFloat) -> Bool {
        return Float(lhs) >= rhs.value
    }
    
    static func < (lhs: Int, rhs: ExactFloat) -> Bool {
        return Float(lhs) < rhs.value
    }
    static func > (lhs: Int, rhs: ExactFloat) -> Bool {
        return Float(lhs) > rhs.value
    }
}
public extension Int64 {
    static func == (lhs: Int64, rhs: ExactFloat) -> Bool {
        return Float(lhs) == rhs.value
    }
    static func <= (lhs: Int64, rhs: ExactFloat) -> Bool {
        return Float(lhs) <= rhs.value
    }
    static func >= (lhs: Int64, rhs: ExactFloat) -> Bool {
        return Float(lhs) >= rhs.value
    }
    
    static func < (lhs: Int64, rhs: ExactFloat) -> Bool {
        return Float(lhs) < rhs.value
    }
    static func > (lhs: Int64, rhs: ExactFloat) -> Bool {
        return Float(lhs) > rhs.value
    }
}
