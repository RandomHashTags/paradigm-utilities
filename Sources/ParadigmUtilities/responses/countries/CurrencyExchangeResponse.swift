//
//  CurrencyExchangeResponse.swift
//  
//
//  Created by Evan Anderson on 10/29/22.
//

import Foundation

public struct CurrencyExchangeResponse : Jsonable {
    public let value:Float
    
    public init(value: Float) {
        self.value = value
    }
}
