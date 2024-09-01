//
//  RemoteNotificationStatusResponse.swift
//  
//
//  Created by Evan Anderson on 10/23/22.
//

public extension Responses.RemoteNotifications {
    struct Status : Jsonable {
        public let value:Bool
        
        public init(value: Bool) {
            self.value = value
        }
    }
}