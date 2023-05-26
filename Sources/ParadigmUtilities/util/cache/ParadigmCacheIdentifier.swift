//
//  ParadigmCacheIdentifier.swift
//  
//
//  Created by Evan Anderson on 5/26/23.
//

import Foundation

public struct ParadigmCacheIdentifier : Hashable {
    public let values:[AnyHashable]
    
    public init(values: AnyHashable...) {
        self.values = values
    }
}
