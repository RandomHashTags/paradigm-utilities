//
//  HumanName.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation

public struct HumanName : Jsonable {
    let first:String, middle:String?, last:String
    
    init(first: String, middle: String? = nil, last: String) {
        self.first = first
        self.middle = middle
        self.last = last
    }
}
