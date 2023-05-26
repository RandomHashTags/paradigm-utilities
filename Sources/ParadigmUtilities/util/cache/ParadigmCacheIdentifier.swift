//
//  ParadigmCacheIdentifier.swift
//  
//
//  Created by Evan Anderson on 5/26/23.
//

import Foundation

public struct ParadigmCacheIdentifier<T: Hashable> : Hashable {
    public let values:[T]
    
    public init(values: T...) {
        self.values = values
    }
}
