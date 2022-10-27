//
//  ClientGovernmentAdministration.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public struct ClientGovernmentAdministration : Jsonable {
    public typealias TranslationKeys = NoTranslationKeys
    
    public let current_version:Int, all_versions:[Int]
    
    public init(current_version: Int, all_versions: [Int]) {
        self.current_version = current_version
        self.all_versions = all_versions
    }
}
