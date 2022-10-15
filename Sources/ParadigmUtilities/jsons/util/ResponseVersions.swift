//
//  ResponseVersions.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct ResponseVersions : Jsonable {
    public let apiVersion:Int, serverVersion:SemanticVersion, appVersion:SemanticVersion
    
    public init(apiVersion: Int, serverVersion: SemanticVersion, appVersion: SemanticVersion) {
        self.apiVersion = apiVersion
        self.serverVersion = serverVersion
        self.appVersion = appVersion
    }
}
