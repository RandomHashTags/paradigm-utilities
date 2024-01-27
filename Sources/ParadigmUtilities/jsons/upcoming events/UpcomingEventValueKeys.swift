//
//  UpcomingEventValueKeys.swift
//  
//
//  Created by Evan Anderson on 5/21/23.
//

import Foundation

public protocol UpcomingEventValueKeys : JsonableKeys {
    var category : UpcomingEventValueCategory { get }
    var value_type : UpcomingEventValueType { get }
    var value_cell_type : UpcomingEventValueCellType { get }
    var value_type_unit : UpcomingEventValueTypeUnit? { get }
    var value_prefix : String? { get }
    var value_string : String? { get }
}
public extension UpcomingEventValueKeys {
    var value_type : UpcomingEventValueType {
        return UpcomingEventValueType.default_type
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

public enum NoUpcomingEventValueKeys : String, UpcomingEventValueKeys {
    case abcdefghijklmnopqrstuvqxyz
    
    public var is_translatable : Bool {
        return false
    }
    
    public var category : UpcomingEventValueCategory {
        return UpcomingEventValueCategory.astronomy_picture_of_the_day
    }
}
