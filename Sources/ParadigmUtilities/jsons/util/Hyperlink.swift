//
//  Hyperlink.swift
//
//
//  Created by Evan Anderson on 7/25/22.
//

import Foundation

public struct Hyperlink : Jsonable {
    public let text:String
    public var url:String
    
    public init(text: String, url: String) {
        self.text = text
        self.url = url
    }
}
