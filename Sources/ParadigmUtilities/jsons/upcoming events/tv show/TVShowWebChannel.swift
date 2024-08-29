//
//  TVShowWebChannel.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

public struct TVShowWebChannel : Jsonable {
    public let id:Int, name:String, country:TVShowCountry?, officialSite:String?
}
