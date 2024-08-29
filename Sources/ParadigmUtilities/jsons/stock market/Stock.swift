//
//  Stock.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct Stock : Jsonable {
    public let symbol:String, name_short:String, name_long:String?, market_regular:StockQuote, market_post:StockQuote?
    
    public init(symbol: String, name_short: String, name_long: String?, market_regular: StockQuote, market_post: StockQuote?) {
        self.symbol = symbol
        self.name_short = name_short
        self.name_long = name_long
        self.market_regular = market_regular
        self.market_post = market_post
    }
}
