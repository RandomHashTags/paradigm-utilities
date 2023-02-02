//
//  Int64Extensions.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

import Foundation

public extension Int64 {
    var date : Date {
        return Date(milliseconds: self)
    }
}
