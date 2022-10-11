//
//  UpcomingEventTypesResponse.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct UpcomingEventTypesResponse : Jsonable {
    let response_version:Int, types:[UpcomingEventTypeResponse], categories:[UpcomingEventTypeCategoryResponse]
    
    public init(response_version: Int, types: [UpcomingEventTypeResponse], categories: [UpcomingEventTypeCategoryResponse]) {
        self.response_version = response_version
        self.types = types
        self.categories = categories
    }
}
public struct UpcomingEventTypeResponse : Jsonable {
    let singular:UpcomingEventTypeNameResponse
    let plural:UpcomingEventTypeNameResponse
    let priorities:UpcomingEventTypePriorities
    let imageURLPrefix:String?
    let values:[ClientUpcomingEventValue]?
    
    public init(singular: UpcomingEventTypeNameResponse, plural: UpcomingEventTypeNameResponse, priorities: UpcomingEventTypePriorities, imageURLPrefix: String?, values: [ClientUpcomingEventValue]?) {
        self.singular = singular
        self.plural = plural
        self.priorities = priorities
        self.imageURLPrefix = imageURLPrefix
        self.values = values
    }
}
public struct UpcomingEventTypeNameResponse : Jsonable {
    let name:String, notificationDescription:String
    
    public init(name: String, notificationDescription: String) {
        self.name = name
        self.notificationDescription = notificationDescription
    }
}
public struct UpcomingEventTypePriorities : Jsonable {
    let widget:Int, app:Int
    
    public init(widget: Int, app: Int) {
        self.widget = widget
        self.app = app
    }
}

public struct ClientUpcomingEventValue : Jsonable {
    let id:String, category:String, valueType:String, valueCellType:String?, valueString:String?, valuePrefix:String?
    var containsSpoiler:Bool = false
    
    public init(id: String, category: String, valueType: String, valueCellType: String?, valueString: String?, valuePrefix: String?, containsSpoiler: Bool) {
        self.id = id
        self.category = category
        self.valueType = valueType
        self.valueCellType = valueCellType
        self.valueString = valueString
        self.valuePrefix = valuePrefix
        self.containsSpoiler = containsSpoiler
    }
}

public struct UpcomingEventTypeCategoryResponse : Jsonable {
    let id:String, header:String?, position:String
    
    public init(id: String, header: String?, position: String) {
        self.id = id
        self.header = header
        self.position = position
    }
}
