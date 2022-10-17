//
//  UpcomingEventProtocol.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public protocol UpcomingEventProtocol : Jsonable {
    var eventDate:EventDate! { get }
    var exactStartMilliseconds:Int64! { get }
    var exactEndMilliseconds:Int64! { get }
    
    var customTypeSingularName:String? { get }
    
    var title:String { get }
    var imageURL:String? { get }
    var countries:[Country]? { get }
    var subdivisions:[SovereignStateSubdivisionWrapper]? { get }
    
    func getIdentifier() -> String
    func getType() -> UpcomingEventType
}
public extension UpcomingEventProtocol {
    func getDateString() -> String {
        return eventDate.getDateString()
    }
    
    func getIdentifier() -> String {
        if let eventDate:EventDate = eventDate {
            return ParadigmUtilities.getEventDateIdentifier(dateString: eventDate.getDateString(), title: title)
        } else if let exactStartMilliseconds:Int64 = exactStartMilliseconds {
            return ParadigmUtilities.getEventDateIdentifier(exactTimeMilliseconds: exactStartMilliseconds, title: title)
        } else {
            return ParadigmUtilities.getEventDateIdentifier(dateString: "NIL", title: title)
        }
    }
}

public protocol GenericUpcomingEventProtocol : UpcomingEventProtocol {
    var description:String? { get }
    var location:String? { get }
    var youtubeVideoIDs:[String]? { get }
    var sources:EventSources { get }
    var hyperlinks:ClientHyperlinks? { get }
}
