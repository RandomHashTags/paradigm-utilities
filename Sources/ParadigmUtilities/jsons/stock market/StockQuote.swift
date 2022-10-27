//
//  StockQuote.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct StockQuote : Jsonable {
    public let open:Float?, high:Float?, low:Float?, change:Float, changePercent:String, price:Float
    
    public init(open: Float?, high: Float?, low: Float?, change: Float, changePercent: String, price: Float) {
        self.open = open
        self.high = high
        self.low = low
        self.change = change
        self.changePercent = changePercent
        self.price = price
    }
}
