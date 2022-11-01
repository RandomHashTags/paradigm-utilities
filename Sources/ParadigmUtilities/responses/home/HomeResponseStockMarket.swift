//
//  HomeResponseStockMarket.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public final class HomeResponseStockMarket : HomeResponseProtocol {
    public static func == (lhs: HomeResponseStockMarket, rhs: HomeResponseStockMarket) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
    }
}
