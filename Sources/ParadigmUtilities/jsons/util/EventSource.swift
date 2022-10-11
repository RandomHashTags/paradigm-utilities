//
//  EventSource.swift
//
//
//  Created by Evan Anderson on 6/14/22.
//

import Foundation

public struct EventSource : Jsonable {
    public let siteName:String, url:String
    
    public init(siteName: String, url: String) {
        self.siteName = siteName
        self.url = url
    }
}
