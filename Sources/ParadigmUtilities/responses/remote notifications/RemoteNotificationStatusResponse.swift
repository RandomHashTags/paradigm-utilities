//
//  RemoteNotificationStatusResponse.swift
//  
//
//  Created by Evan Anderson on 10/23/22.
//

public struct RemoteNotificationStatusResponse : Jsonable {
    public let value:Bool
    
    public init(value: Bool) {
        self.value = value
    }
}
