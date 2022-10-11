//
//  PresentationTypesResponse.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct PresentationTypesResponse : Jsonable {
    let response_version:Int, types:[ClientPresentationType]
    
    public init(response_version: Int, types: [ClientPresentationType]) {
        self.response_version = response_version
        self.types = types
    }
}
