//
//  EventDate.swift
//
//
//  Created by Evan Anderson on 6/13/22.
//

import Foundation

public struct EventDate : Comparable, Hashable, Codable {
    private static var sameHourComponents:DateComponents = {
        var components:DateComponents = DateComponents()
        components.hour = 0
        components.minute = 0
        components.second = 0
        components.nanosecond = 0
        return components
    }()
    public static func < (lhs: EventDate, rhs: EventDate) -> Bool {
        let left:DateComponents = lhs.components, right:DateComponents = rhs.components
        guard let leftYear:Int = left.year, let rightYear:Int = right.year,
              let leftMonth:Int = left.month, let rightMonth:Int = right.month,
              let leftDay:Int = left.day, let rightDay:Int = right.day
        else {
            return false
        }
        return leftYear < rightYear || leftYear == rightYear && (leftMonth < rightMonth || leftMonth == rightMonth && leftDay < rightDay)
    }
    
    public static func getTodayDateString() -> String {
        return EventDate.getDateString(date: ParadigmUtilities.getNow())
    }
    
    public static func getDateString(date: Date) -> String {
        let components:DateComponents = ParadigmUtilities.calendar().dateComponents([.month, .year, .day], from: date)
        return getDateString(components: components)
    }
    public static func getDateString(components: DateComponents) -> String {
        return getDateString(year: components.year!, month: components.month!, day: components.day!)
    }
    public static func getDateString(year: Int, month: Int, day: Int) -> String {
        return month.description + "-" + year.description + "-" + (day < 10 ? "0" : "") + day.description
    }
    public static func getISO8601(date: Date) -> String {
        let components:DateComponents = ParadigmUtilities.calendar().dateComponents([.year, .month, .day], from: date)
        let year:Int = components.year!, month:Int = components.month!, day:Int = components.day!
        return year.description + "-" + (month < 10 ? "0" : "") + month.description + "-" + (day < 10 ? "0" : "") + day.description + "T00:00:00Z"
    }
    
    public static func from(dateString: String) -> EventDate {
        let values:[String] = dateString.components(separatedBy: "-")
        let month:Int = Int(values[0])!, year:Int = Int(values[1])!, day:Int = Int(values[2])!
        return EventDate(year: year, month: month, day: day)
    }
    
    public static func getFirst(dayOfWeek: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 1, dayOfWeek: dayOfWeek, year: year, month: month, day: 1)
    }
    public static func getSecond(dayOfWeek: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 2, dayOfWeek: dayOfWeek, year: year, month: month, day: 1)
    }
    public static func getThird(dayOfWeek: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 3, dayOfWeek: dayOfWeek, year: year, month: month, day: 1)
    }
    public static func getFourth(dayOfWeek: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 4, dayOfWeek: dayOfWeek, year: year, month: month, day: 1)
    }
    public static func getLast(dayOfWeek: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 5, dayOfWeek: dayOfWeek, year: year, month: month, day: 1) ?? getFourth(dayOfWeek: dayOfWeek, month: month, year: year)
    }
    public static func getFirstAfter(dayOfWeek: DayOfWeek, year: Int, month: Month, day: Int) -> EventDate? {
        return get(amount: 1, dayOfWeek: dayOfWeek, year: year, month: month, day: day)
    }
    
    private static func get(amount: Int, dayOfWeek: DayOfWeek, year: Int, month: Month, day: Int) -> EventDate? {
        let calendar:Calendar = ParadigmUtilities.calendar()
        var startingComponents:DateComponents = DateComponents()
        startingComponents.month = month.rawValue
        startingComponents.year = year
        startingComponents.day = day
        guard let date:Date = calendar.date(from: startingComponents) else { return nil }
        
        let dayOfWeekValue:Int = dayOfWeek.rawValue, monthValue:Int = month.rawValue
        let startingDay:Int = amount == 1 ? 1 : (amount - 1) * 7, endingDay:Int = startingDay + 7
        for i in startingDay..<endingDay {
            let targetDate:Date = date.addingTimeInterval(.days(i))
            let components:DateComponents = calendar.dateComponents([.weekday, .month], from: targetDate)
            if dayOfWeekValue == components.weekday && monthValue == components.month {
                return EventDate(date: targetDate)
            }
        }
        return nil
    }
    
    public var components:DateComponents
    
    public init(year: Int, month: Month, day: Int) {
        self.init(year: year, month: month.rawValue, day: day)
    }
    public init(year: Int, month: Int, day: Int) {
        var components:DateComponents = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        self.components = components
    }
    
    public init(date: Date) {
        components = ParadigmUtilities.calendar().dateComponents([.month, .year, .day], from: date)
    }
    public init(components: DateComponents) {
        self.components = components
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let dateString:String = try container.decode(String.self)
        self = EventDate.from(dateString: dateString)
    }
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(getDateString())
    }
    
    public func toDate() -> Date {
        return ParadigmUtilities.calendar().date(from: components)!
    }
    public mutating func adding(_ timeInterval: TimeInterval) {
        let calendar:Calendar = ParadigmUtilities.calendar()
        let seconds:Int = Int(timeInterval)
        let newDate:Date = calendar.date(byAdding: .second, value: seconds, to: toDate())!
        components = calendar.dateComponents([.month, .year, .day], from: newDate)
    }
    public func plus(_ timeInterval: TimeInterval) -> EventDate {
        let seconds:Int = Int(timeInterval)
        let newDate:Date = ParadigmUtilities.calendar().date(byAdding: .second, value: seconds, to: toDate())!
        return EventDate(date: newDate)
    }
    public func getDateString() -> String {
        return EventDate.getDateString(components: components)
    }
    
    public func getFirstWeekdayAfter() -> EventDate {
        let date:Date = toDate()
        switch date.dayOfWeek {
        case .friday:
            return EventDate(date: date.addingTimeInterval(.days(3)))
        case .saturday:
            return EventDate(date: date.addingTimeInterval(.days(2)))
        default:
            return EventDate(date: date.addingTimeInterval(.days(1)))
        }
    }
    
    public func previousDay() -> EventDate {
        return nextDate(direction: .backward)
    }
    public func nextDay() -> EventDate {
        return nextDate(direction: .forward)
    }
    private func nextDate(direction: Calendar.SearchDirection) -> EventDate {
        var date:Date! = nil, selfDate:Date = toDate()
        let calendar:Calendar = ParadigmUtilities.calendar(), components:DateComponents = EventDate.sameHourComponents
        while date == nil {
            date = calendar.nextDate(after: selfDate, matching: components, matchingPolicy: .nextTime, direction: direction)
        }
        return EventDate(date: date)
    }
}
