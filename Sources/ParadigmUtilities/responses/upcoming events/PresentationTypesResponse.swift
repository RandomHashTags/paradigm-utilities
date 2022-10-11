//
//  PresentationTypesResponse.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PresentationTypesResponse : Jsonable {
    let response_version:Int, types:[ClientPresentationType]
}
