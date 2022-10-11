//
//  ClientPresentationType.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct ClientPresentationType : Jsonable {
    let id:String, name:String, type:String, aliases:[String]?, defaultImageURL:String?
}
