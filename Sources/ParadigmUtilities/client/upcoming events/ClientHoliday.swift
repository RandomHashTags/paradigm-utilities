//
//  ClientHoliday.swift
//
//
//  Created by Evan Anderson on 10/6/22.
//

import Foundation

public struct ClientHoliday : Jsonable {
    public let response_version:Int, id:String, name:String, description:String, aliases:[String]?, imageURL:String?, type:String, sources:EventSources?
}
