import Foundation

public enum ParadigmUtilities {
    static func calendar() -> Calendar {
        return Calendar.current
    }
    
    public static func getNow() -> Date {
        var date:Date = Date()
        while date.year < 2022 {
            date = Date()
        }
        return date
    }
}
