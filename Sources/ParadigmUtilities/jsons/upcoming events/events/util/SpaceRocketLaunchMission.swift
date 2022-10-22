//
//  SpaceRocketLaunchMission.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation

public struct SpaceRocketLaunchMission : Jsonable {
    public let name:String, description:String, type:String, windowStart:Int64, windowEnd:Int64?, exactDay:Bool?, exactTime:Bool?, status:String, probability:String, videoURL:String?
    
    public init(name: String, description: String, type: String, windowStart: Int64, windowEnd: Int64?, exactDay: Bool, exactTime: Bool, status: String, probability: String, videoURL: String?) {
        self.name = name
        self.description = description
        self.type = type
        self.windowStart = windowStart
        self.windowEnd = windowEnd
        self.exactDay = exactDay ? exactDay : nil
        self.exactTime = exactTime ? exactTime : nil
        self.status = status
        self.probability = probability
        self.videoURL = videoURL
    }
}
