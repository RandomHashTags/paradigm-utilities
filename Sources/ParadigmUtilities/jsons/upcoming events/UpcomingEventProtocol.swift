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
    var exact_start : Int64? { get }
    var exact_end : Int64? { get }
    
    var custom_type_singular_name : String? { get set }
    
    var title : String { get set }
    var image_url : String? { get set }
    var countries : [Country]? { get }
    var subdivisions : [SovereignStateSubdivisionWrapper]? { get }
    
    func getIdentifier() -> String
}
public extension UpcomingEventProtocol {
    func getDateString() -> String? {
        return event_date?.date_string
    }
    
    func getIdentifier() -> String {
        if let eventDate:EventDate = event_date {
            return ParadigmUtilities.getEventDateIdentifier(dateString: eventDate.date_string, title: title)
        } else if let exactStartMilliseconds:Int64 = exact_start {
            return ParadigmUtilities.getEventDateIdentifier(exactTimeMilliseconds: exactStartMilliseconds, title: title)
        } else {
            return ParadigmUtilities.getEventDateIdentifier(dateString: "NIL", title: title)
        }
    }
}
