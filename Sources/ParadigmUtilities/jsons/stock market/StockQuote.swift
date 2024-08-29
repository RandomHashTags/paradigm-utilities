//
//  StockQuote.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct StockQuote : Jsonable {
    public let open:Float?, high:Float?, low:Float?, change:Float, change_percent:String, price:Float
    
    public init(open: Float?, high: Float?, low: Float?, change: Float, change_percent: String, price: Float) {
        self.open = open
        self.high = high
        self.low = low
        self.change = change
        self.change_percent = change_percent
        self.price = price
    }
}
