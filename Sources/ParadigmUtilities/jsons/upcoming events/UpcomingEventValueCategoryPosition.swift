//
//  UpcomingEventValueCategoryPosition.swift
//
//
//  Created by Evan Anderson on 6/15/22.
//

import Foundation

public enum UpcomingEventValueCategoryPosition : String, CaseIterable, Jsonable {
    case pre_content
    case above_description
    case below_description
    case post_description
    case post_videos
    case post_content
    
    public static func valueOf(_ string: String?) -> UpcomingEventValueCategoryPosition? {
        guard let string:String = string else { return nil }
        return UpcomingEventValueCategoryPosition.allCases.first(where: { string.elementsEqual($0.rawValue) })
    }
}
