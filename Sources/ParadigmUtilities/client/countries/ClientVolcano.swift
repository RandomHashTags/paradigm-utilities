//
//  ClientVolcano.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientVolcano : Jsonable {
    let id:String, name:String, type:String, summary:String?, imageURL:String?, country:Country, sources:EventSources
}
