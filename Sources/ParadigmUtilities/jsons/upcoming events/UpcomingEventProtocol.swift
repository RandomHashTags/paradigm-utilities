//
//  UpcomingEventProtocol.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public protocol UpcomingEventProtocol : Jsonable {
    var type : UpcomingEventType? { get }
    var event_date : EventDate? { get }
    var begins : Date? { get }
    var ends : Date? { get }
    
    var custom_type_singular_name : String? { get set }
    
    var title : String { get set }
    var images : [String] { get set }
    var countries : [Country]? { get }
    var subdivisions : [SovereignStateSubdivisionWrapper]? { get }
    
    func getIdentifier() -> String
}
public extension UpcomingEventProtocol {
    func optimize_images(_ images: [String]) -> [String] {
        guard let prefix:String = type?.image_url_prefix else { return images }
        return images.map({ $0.starts(with: prefix) ? $0.substring(from: prefix.count) : $0 })
    }
    func getDateString() -> String? {
        return event_date?.date_string
    }
    
    func getIdentifier() -> String {
        if let eventDate:EventDate = event_date {
            return ParadigmUtilities.getEventDateIdentifier(dateString: eventDate.date_string, title: title)
        } else if let exactStartMilliseconds:Int64 = begins?.milliseconds {
            return ParadigmUtilities.getEventDateIdentifier(exactTimeMilliseconds: exactStartMilliseconds, title: title)
        } else {
            return ParadigmUtilities.getEventDateIdentifier(dateString: "NIL", title: title)
        }
    }
}
