//
//  EventDate.swift
//
//
//  Created by Evan Anderson on 6/13/22.
//

import Foundation

public struct EventDate : Comparable, Jsonable {
    private static var same_hour_components:DateComponents = {
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
    
    public static var today : EventDate {
        return EventDate(ParadigmUtilities.now)
    }
    public static var today_date_string : String {
        return EventDate.getDateString(date: ParadigmUtilities.now)
    }
    
    public static func getDateString(date: Date) -> String {
        let components:DateComponents = Calendar.current.dateComponents([.month, .year, .day], from: date)
        return getDateString(components: components)
    }
    public static func getDateString(components: DateComponents) -> String {
        return getDateString(year: components.year!, month: components.month!, day: components.day!)
    }
    public static func getDateString(year: Int, month: Int, day: Int) -> String {
        return month.description + "-" + year.description + "-" + (day < 10 ? "0" : "") + day.description
    }
    public static func getISO8601(date: Date) -> String {
        let components:DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let year:Int = components.year!, month:Int = components.month!, day:Int = components.day!
        return year.description + "-" + (month < 10 ? "0" : "") + month.description + "-" + (day < 10 ? "0" : "") + day.description + "T00:00:00Z"
    }
    
    public static func from(dateString: String) -> EventDate {
        let values:[Substring] = dateString.split(separator: "-")
        let month:Int = values[0].parse_int ?? 1, year:Int = values[1].parse_int ?? 0, day:Int = values[2].parse_int ?? 0
        return EventDate(year: year, month: month, day: day)
    }
    
    public static func get_first(day_of_week: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 1, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    public static func get_second(day_of_week: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 2, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    public static func get_third(day_of_week: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 3, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    public static func get_fourth(day_of_week: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 4, day_of_week: day_of_week, year: year, month: month, day: 1)
    }
    public static func get_last(day_of_week: DayOfWeek, month: Month, year: Int) -> EventDate? {
        return get(amount: 5, day_of_week: day_of_week, year: year, month: month, day: 1) ?? get_fourth(day_of_week: day_of_week, month: month, year: year)
    }
    public static func get_first_after(day_of_week: DayOfWeek, year: Int, month: Month, day: Int) -> EventDate? {
        return get(amount: 1, day_of_week: day_of_week, year: year, month: month, day: day)
    }
    
    private static func get(amount: Int, day_of_week: DayOfWeek, year: Int, month: Month, day: Int) -> EventDate? {
        let calendar:Calendar = Calendar.current
        var startingComponents:DateComponents = DateComponents()
        startingComponents.month = month.rawValue
        startingComponents.year = year
        startingComponents.day = day
        guard let date:Date = calendar.date(from: startingComponents) else { return nil }
        
        let dayOfWeekValue:Int = day_of_week.rawValue, monthValue:Int = month.rawValue
        let startingDay:Int = amount == 1 ? 1 : (amount - 1) * 7, endingDay:Int = startingDay + 7
        for i in startingDay..<endingDay {
            let targetDate:Date = date.addingTimeInterval(.days(i))
            let components:DateComponents = calendar.dateComponents([.weekday, .month], from: targetDate)
            if dayOfWeekValue == components.weekday && monthValue == components.month {
                return EventDate(targetDate)
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
    
    public init(_ date: Date) {
        components = Calendar.current.dateComponents([.month, .year, .day], from: date)
    }
    public init(_ components: DateComponents) {
        self.components = components
    }
    
    public init(from decoder: Decoder) throws {
        let container:SingleValueDecodingContainer = try decoder.singleValueContainer()
        let dateString:String = try container.decode(String.self)
        self = EventDate.from(dateString: dateString)
    }
    public func encode(to encoder: Encoder) throws {
        var container:SingleValueEncodingContainer = encoder.singleValueContainer()
        try container.encode(date_string)
    }
    
    public var date : Date {
        return Calendar.current.date(from: components)!
    }
    public mutating func adding(_ timeInterval: TimeInterval) {
        let calendar:Calendar = Calendar.current
        let seconds:Int = Int(timeInterval)
        let newDate:Date = calendar.date(byAdding: .second, value: seconds, to: date)!
        components = calendar.dateComponents([.month, .year, .day], from: newDate)
    }
    public func plus(_ timeInterval: TimeInterval) -> EventDate {
        let seconds:Int = Int(timeInterval)
        let newDate:Date = Calendar.current.date(byAdding: .second, value: seconds, to: date)!
        return EventDate(newDate)
    }
    public var date_string : String {
        return EventDate.getDateString(components: components)
    }
    
    public func getFirstWeekdayAfter() -> EventDate {
        let date:Date = date
        switch date.day_of_week {
        case .friday:
            return EventDate(date.addingTimeInterval(.days(3)))
        case .saturday:
            return EventDate(date.addingTimeInterval(.days(2)))
        default:
            return EventDate(date.addingTimeInterval(.days(1)))
        }
    }
    
    public var previous_date : EventDate {
        return nextDate(direction: .backward)
    }
    public var next_date : EventDate {
        return nextDate(direction: .forward)
    }
    private func nextDate(direction: Calendar.SearchDirection) -> EventDate {
        var date:Date! = nil, selfDate:Date = date
        let calendar:Calendar = Calendar.current, components:DateComponents = EventDate.same_hour_components
        while date == nil {
            date = calendar.nextDate(after: selfDate, matching: components, matchingPolicy: .nextTime, direction: direction)
        }
        return EventDate(date)
    }
}
