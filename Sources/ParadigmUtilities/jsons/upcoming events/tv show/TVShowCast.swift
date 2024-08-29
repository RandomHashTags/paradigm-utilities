//
//  TVShowCast.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

public struct TVShowCast : Jsonable {
    public let person:TVShowPerson?
    public let character:TVShowPerson?
    public let `self`:Bool, voice:Bool
}
