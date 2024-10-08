//
//  StringExtensions.swift
//  
//
//  Created by Evan Anderson on 2/8/23.
//

public extension String {
    func index(from: Int) -> Index {
        return index(startIndex, offsetBy: from)
    }
    func substring(from: Int) -> String {
        let fromIndex:Index = index(from: from)
        return String(self[fromIndex...])
    }
    func substring(to: Int) -> String {
        let toIndex:Index = index(from: to)
        return String(self[..<toIndex])
    }
    func substring(with range: Range<Int>) -> String {
        let startIndex:Index = index(from: range.lowerBound)
        let endIndex:Index = index(from: range.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

public extension StringProtocol {
    var parse_int : Int? {
        return Int(self)
    }
    var parse_int64 : Int64? {
        return Int64(self)
    }
    
    var parse_uint : UInt? {
        return UInt(self)
    }
    var parse_uint64 : UInt64? {
        return UInt64(self)
    }
    
    var parse_float : Float? {
        return Float(self)
    }
    var parse_double : Double? {
        return Double(self)
    }
    
    var parse_month : Month? {
        return Month.valueOf(self)
    }
    
    func matches(regex: any StringProtocol) -> Bool {
        return range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
    
    func is_date_string() -> Bool {
        return matches(regex: "[0-9]+-[0-9]+-[0-9]+")
    }
}

public extension Substring {
    var as_string : String {
        return String(self)
    }
}
