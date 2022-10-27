//
//  PingResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct PingResponse : Jsonable {
    public let response_versions:ResponseVersions
    
    public init(response_versions: ResponseVersions) {
        self.response_versions = response_versions
    }
}
