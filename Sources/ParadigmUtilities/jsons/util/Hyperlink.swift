//
//  Hyperlink.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

public struct Hyperlink : Jsonable {    
    public var text:String
    public var url:String
    
    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }
}