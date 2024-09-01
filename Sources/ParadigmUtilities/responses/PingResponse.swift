//
//  PingResponse.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public extension Responses {
    struct Ping : Jsonable {
        public let response_versions:ResponseVersions
        
        public init(response_versions: ResponseVersions) {
            self.response_versions = response_versions
        }
    }
}