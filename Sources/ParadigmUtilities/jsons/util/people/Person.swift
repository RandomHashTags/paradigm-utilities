//
//  Person.swift
//  
//
//  Created by Evan Anderson on 10/18/22.
//

import Foundation

public protocol Person : Jsonable {
    var name:HumanName { get }
    var image_url:String? { get }
}
