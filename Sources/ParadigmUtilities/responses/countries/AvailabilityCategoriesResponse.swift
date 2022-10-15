//
//  AvailabilityCategoriesResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct AvailabilityCategoriesResponse : Jsonable {
    public let response_version:Int, imageURLPrefix:String, categories:[SovereignStateAvailabilityCategory]
}
