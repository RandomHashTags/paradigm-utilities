//
//  UpcomingEventProtocol.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import SwiftSovereignStates

public protocol UpcomingEventProtocol : Jsonable {
    var type:UpcomingEventType! { get }
    var id:String? { get }
    var event_date:EventDate? { get }
    var exact_start:Int64? { get }
    var exact_end:Int64? { get }
    
    var custom_type_singular_name:String? { get }
    
    var title:String { get }
    var image_url:String? { get }
    var countries:[Country]? { get }
    var subdivisions:[SovereignStateSubdivisionWrapper]? { get }
    
    func getIdentifier() -> String
}
public extension UpcomingEventProtocol {
    func getDateString() -> String {
        return event_date?.date_string ?? "-1"
    }
    
    func getIdentifier() -> String {
        let prefix:String = id?.appending("_") ?? ""
        if let eventDate:EventDate = event_date {
            return prefix + ParadigmUtilities.getEventDateIdentifier(dateString: eventDate.date_string, title: title)
        } else if let exactStartMilliseconds:Int64 = exact_start {
            return prefix + ParadigmUtilities.getEventDateIdentifier(exactTimeMilliseconds: exactStartMilliseconds, title: title)
        } else {
            return prefix + ParadigmUtilities.getEventDateIdentifier(dateString: "NIL", title: title)
        }
    }
}

public protocol GenericUpcomingEventProtocol : UpcomingEventProtocol {
    var description:String? { get }
    var location:String? { get }
    var youtube_video_ids:[String]? { get }
    var sources:EventSources { get }
    var hyperlinks:Hyperlinks? { get }
}

public protocol UpcomingEventValueKeys : CaseIterable, CodingKey, RawRepresentable where RawValue == String {
    var category : UpcomingEventValueCategory { get }
    var value_type : UpcomingEventValueType { get }
    var value_cell_type : UpcomingEventValueCellType { get }
    var value_type_unit : UpcomingEventValueTypeUnit? { get }
    var value_prefix : String? { get }
    var value_string : String? { get }
}
public extension UpcomingEventValueKeys {
    var value_type : UpcomingEventValueType {
        return UpcomingEventValueType.defaultType()
    }
    var value_cell_type : UpcomingEventValueCellType {
        return UpcomingEventValueCellType.label
    }
    var value_type_unit : UpcomingEventValueTypeUnit? {
        return nil
    }
    var value_prefix : String? {
        return nil
    }
    var value_string : String? {
        return nil
    }
}
