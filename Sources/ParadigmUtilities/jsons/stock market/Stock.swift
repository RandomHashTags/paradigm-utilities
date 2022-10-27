//
//  Stock.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct Stock : Jsonable {
    public let symbol:String, shortName:String, longName:String?, regularMarket:StockQuote, postMarket:StockQuote?
    
    public init(symbol: String, shortName: String, longName: String?, regularMarket: StockQuote, postMarket: StockQuote?) {
        self.symbol = symbol
        self.shortName = shortName
        self.longName = longName
        self.regularMarket = regularMarket
        self.postMarket = postMarket
    }
}
