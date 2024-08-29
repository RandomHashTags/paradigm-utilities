//
//  RoundedFloat.swift
//  
//
//  Created by Evan Anderson on 4/5/23.
//

public struct RoundedFloat : Hashable, Codable, Comparable {
    public var value:Float
    
    public init(_ value: Float) {
        self.value = value
    }
    public init(_ value: any BinaryInteger) {
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
    
    public static func == (lhs: RoundedFloat, rhs: RoundedFloat) -> Bool {
        return lhs.value == rhs.value
    }
    public static func == (lhs: RoundedFloat, rhs: Float) -> Bool {
        return lhs.value == rhs
    }
    public static func == (lhs: RoundedFloat, rhs: any BinaryInteger) -> Bool {
        return lhs.value == Float(rhs)
    }
    
    public static func <= (lhs: RoundedFloat, rhs: RoundedFloat) -> Bool {
        return lhs.value <= rhs.value
    }
    public static func <= (lhs: RoundedFloat, rhs: Float) -> Bool {
        return lhs.value <= rhs
    }
    public static func <= (lhs: RoundedFloat, rhs: any BinaryInteger) -> Bool {
        return lhs.value <= Float(rhs)
    }
    
    public static func >= (lhs: RoundedFloat, rhs: RoundedFloat) -> Bool {
        return lhs.value >= rhs.value
    }
    public static func >= (lhs: RoundedFloat, rhs: Float) -> Bool {
        return lhs.value >= rhs
    }
    public static func >= (lhs: RoundedFloat, rhs: any BinaryInteger) -> Bool {
        return lhs.value >= Float(rhs)
    }
    
    public static func < (lhs: RoundedFloat, rhs: RoundedFloat) -> Bool {
        return lhs.value < rhs.value
    }
    public static func < (lhs: RoundedFloat, rhs: Float) -> Bool {
        return lhs.value < rhs
    }
    public static func < (lhs: RoundedFloat, rhs: any BinaryInteger) -> Bool {
        return lhs.value < Float(rhs)
    }
    
    public static func > (lhs: RoundedFloat, rhs: RoundedFloat) -> Bool {
        return lhs.value > rhs.value
    }
    public static func > (lhs: RoundedFloat, rhs: Float) -> Bool {
        return lhs.value > rhs
    }
    public static func > (lhs: RoundedFloat, rhs: any BinaryInteger) -> Bool {
        return lhs.value > Float(rhs)
    }
    
    public static func * (left: RoundedFloat, right: RoundedFloat) -> RoundedFloat {
        return RoundedFloat(left.value * right.value)
    }
    public static func * (left: RoundedFloat, right: Float) -> RoundedFloat {
        return RoundedFloat(left.value * right)
    }
    public static func * (left: RoundedFloat, right: any BinaryInteger) -> RoundedFloat {
        return RoundedFloat(left.value * Float(right))
    }
    
    public static func *= (left: inout RoundedFloat, right: RoundedFloat) {
        left.value *= right.value
    }
    public static func *= (left: inout RoundedFloat, right: Float) {
        left.value *= right
    }
    public static func *= (left: inout RoundedFloat, right: any BinaryInteger) {
        left.value *= Float(right)
    }
    
    public static func / (left: RoundedFloat, right: RoundedFloat) -> RoundedFloat {
        return RoundedFloat(left.value / right.value)
    }
    public static func / (left: RoundedFloat, right: Float) -> RoundedFloat {
        return RoundedFloat(left.value / right)
    }
    public static func / (left: RoundedFloat, right: any BinaryInteger) -> RoundedFloat {
        return RoundedFloat(left.value / Float(right))
    }
    
    public static func + (left: RoundedFloat, right: RoundedFloat) -> RoundedFloat {
        return RoundedFloat(left.value + right.value)
    }
    public static func + (left: RoundedFloat, right: Float) -> RoundedFloat {
        return RoundedFloat(left.value + right)
    }
    public static func + (left: RoundedFloat, right: any BinaryInteger) -> RoundedFloat {
        return RoundedFloat(left.value + Float(right))
    }
    
    public static func - (left: RoundedFloat, right: RoundedFloat) -> RoundedFloat {
        return RoundedFloat(left.value - right.value)
    }
    public static func - (left: RoundedFloat, right: Float) -> RoundedFloat {
        return RoundedFloat(left.value - right)
    }
    public static func - (left: RoundedFloat, right: any BinaryInteger) -> RoundedFloat {
        return RoundedFloat(left.value - Float(right))
    }
}
public extension Float {
    static func == (lhs: Float, rhs: RoundedFloat) -> Bool {
        return lhs == rhs.value
    }
    static func <= (lhs: Float, rhs: RoundedFloat) -> Bool {
        return lhs <= rhs.value
    }
    static func >= (lhs: Float, rhs: RoundedFloat) -> Bool {
        return lhs >= rhs.value
    }
    
    static func < (lhs: Float, rhs: RoundedFloat) -> Bool {
        return lhs < rhs.value
    }
    static func > (lhs: Float, rhs: RoundedFloat) -> Bool {
        return lhs > rhs.value
    }
    
    static func * (left: Float, right: RoundedFloat) -> Float {
        return left * right.value
    }
    
    static func / (left: Float, right: RoundedFloat) -> Float {
        return left / right.value
    }
    
    static func + (left: Float, right: RoundedFloat) -> Float {
        return left + right.value
    }
    
    static func - (left: Float, right: RoundedFloat) -> Float {
        return left - right.value
    }
}
public extension Int {
    static func == (lhs: Int, rhs: RoundedFloat) -> Bool {
        return Float(lhs) == rhs.value
    }
    static func <= (lhs: Int, rhs: RoundedFloat) -> Bool {
        return Float(lhs) <= rhs.value
    }
    static func >= (lhs: Int, rhs: RoundedFloat) -> Bool {
        return Float(lhs) >= rhs.value
    }
    
    static func < (lhs: Int, rhs: RoundedFloat) -> Bool {
        return Float(lhs) < rhs.value
    }
    static func > (lhs: Int, rhs: RoundedFloat) -> Bool {
        return Float(lhs) > rhs.value
    }
}
public extension Int64 {
    static func == (lhs: Int64, rhs: RoundedFloat) -> Bool {
        return Float(lhs) == rhs.value
    }
    static func <= (lhs: Int64, rhs: RoundedFloat) -> Bool {
        return Float(lhs) <= rhs.value
    }
    static func >= (lhs: Int64, rhs: RoundedFloat) -> Bool {
        return Float(lhs) >= rhs.value
    }
    
    static func < (lhs: Int64, rhs: RoundedFloat) -> Bool {
        return Float(lhs) < rhs.value
    }
    static func > (lhs: Int64, rhs: RoundedFloat) -> Bool {
        return Float(lhs) > rhs.value
    }
}
