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
    var countries:Set<Country>? { get }
    var subdivisions:Set<SovereignStateSubdivisionWrapper>? { get }
    
    func getIdentifier() -> String
}
public extension UpcomingEventProtocol {
    func getDateString() -> String {
        return event_date?.getDateString() ?? "-1"
    }
    
    func getIdentifier() -> String {
        let prefix:String = id?.appending("_") ?? ""
        if let eventDate:EventDate = event_date {
            return prefix + ParadigmUtilities.getEventDateIdentifier(dateString: eventDate.getDateString(), title: title)
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
    var youtube_video_ids:Set<String>? { get }
    var sources:EventSources { get }
    var hyperlinks:Hyperlinks? { get }
}

public protocol UpcomingEventValueKeys : CaseIterable, CodingKey, RawRepresentable where RawValue == String {
    func getCategory() -> UpcomingEventValueCategory
    func getValueType() -> UpcomingEventValueType
    func getValueCellType() -> UpcomingEventValueCellType
    func getValueTypeUnit() -> UpcomingEventValueTypeUnit?
    func getValuePrefix() -> String?
    func getValueString() -> String?
}
public extension UpcomingEventValueKeys {
    func getValueType() -> UpcomingEventValueType {
        return UpcomingEventValueType.defaultType()
    }
    func getValueCellType() -> UpcomingEventValueCellType {
        return UpcomingEventValueCellType.label
    }
    func getValueTypeUnit() -> UpcomingEventValueTypeUnit? {
        return nil
    }
    func getValuePrefix() -> String? {
        return nil
    }
    func getValueString() -> String? {
        return nil
    }
}
