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
    
    public static func getEventDateIdentifier(dateString: String, title: String) -> String {
        return parseEventDateIdentifier(key: dateString, title: title)
    }
    public static func getEventDateIdentifier(exactTimeMilliseconds: Int64, title: String) -> String {
        return parseEventDateIdentifier(key: exactTimeMilliseconds.description, title: title)
    }
    private static func parseEventDateIdentifier(key: String, title: String) -> String {
        let id:String = title.replacingOccurrences(of: "[^a-zA-Z0-9]+", with: "_", options: .regularExpression)
        return key + "." + id
    }
}
