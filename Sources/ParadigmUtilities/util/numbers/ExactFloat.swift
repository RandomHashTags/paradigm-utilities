//
//  ExactFloat.swift
//  
//
//  Created by Evan Anderson on 4/5/23.
//

import Foundation

public struct ExactFloat : Codable, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    public typealias IntegerLiteralType = Int
    public typealias FloatLiteralType = Float
    
    public var value:Float
    
    public init(_ value: Float) {
        self.value = value
    }
    public init(_ value: Int) {
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
    
    public static func * (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value * right.value)
    }
    public static func * (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value * right)
    }
    
    public static func / (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value / right.value)
    }
    public static func / (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value / right)
    }
    
    public static func + (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value + right.value)
    }
    public static func + (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value + right)
    }
    
    public static func - (left: ExactFloat, right: ExactFloat) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value - right.value)
    }
    public static func - (left: ExactFloat, right: Float) -> ExactFloat {
        return ExactFloat(floatLiteral: left.value - right)
    }
}
public extension Float {
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
