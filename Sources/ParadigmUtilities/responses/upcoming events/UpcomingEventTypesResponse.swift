//
//  UpcomingEventTypesResponse.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct UpcomingEventTypesResponse : Jsonable {
    let response_version:Int, types:[UpcomingEventTypeResponse], categories:[UpcomingEventTypeCategoryResponse]
}
public struct UpcomingEventTypeResponse : Jsonable {
    let singular:UpcomingEventTypeNameResponse
    let plural:UpcomingEventTypeNameResponse
    let priorities:UpcomingEventTypePriorities
    let imageURLPrefix:String?
    let values:[ClientUpcomingEventValue]?
}
public struct UpcomingEventTypeNameResponse : Jsonable {
    let name:String, notificationDescription:String
}
public struct UpcomingEventTypePriorities : Jsonable {
    let widget:Int, app:Int
}

public struct ClientUpcomingEventValue : Jsonable {
    let id:String, category:String, valueType:String, valueCellType:String?, valueString:String?, valuePrefix:String?
    var containsSpoiler:Bool = false
}

public struct UpcomingEventTypeCategoryResponse : Jsonable {
    let id:String, header:String?, position:String
}
