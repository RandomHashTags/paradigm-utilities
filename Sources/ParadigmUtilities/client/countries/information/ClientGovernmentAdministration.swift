//
//  ClientGovernmentAdministration.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct ClientGovernmentAdministration : Jsonable {
    public let current_version:Int, all_versions:Set<Int>
    
    public init(current_version: Int, all_versions: Set<Int>) {
        self.current_version = current_version
        self.all_versions = all_versions
    }
}
