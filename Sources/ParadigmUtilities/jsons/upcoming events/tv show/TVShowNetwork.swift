//
//  TVShowNetwork.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

public struct TVShowNetwork : Jsonable {
    public let id:Int, name:String, country:TVShowCountry?, officialSite:String?
}
