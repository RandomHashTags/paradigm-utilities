import Foundation

public enum ParadigmUtilities {
    public static var now : Date {
        var date:Date = Date()
        while date.year < 2023 {
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
