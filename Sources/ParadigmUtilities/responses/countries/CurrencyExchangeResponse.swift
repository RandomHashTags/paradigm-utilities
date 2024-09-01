//
//  CurrencyExchangeResponse.swift
//  
//
//  Created by Evan Anderson on 10/29/22.
//

public extension Responses.Countries {
    struct CurrencyExchangeResponse : Jsonable {
        public let value:Float
        
        public init(value: Float) {
            self.value = value
        }
    }
}