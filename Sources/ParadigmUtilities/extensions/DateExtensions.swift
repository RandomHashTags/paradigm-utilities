//
//  DateExtensions.swift
//
//
//  Created by Evan Anderson on 6/21/22.
//

import Foundation

public extension Date {
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1_000))
    }
    
    var milliseconds : Int64 {
        return Int64(timeIntervalSince1970 * 1_000)
    }
    
    var dayOfWeek : DayOfWeek? {
        let component:Int = Calendar.current.component(.weekday, from: self)
        return DayOfWeek.valueOf(component)
    }
    
    var month : Month? {
        let component:Int = Calendar.current.component(.month, from: self)
        return Month.valueOf(component)
    }
    
    var year : Int {
        return Calendar.current.component(.year, from: self)
    }
    func getYearMonthDay() -> (Int, Int, Int) {
        let components:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return (components.year!, components.month!, components.day!)
    }
}
