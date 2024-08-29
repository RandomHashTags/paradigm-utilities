//
//  SpaceRocketLaunchMission.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct SpaceRocketLaunchMission : Jsonable {    
    public var name:String, description:String, type:String
    public let window_start:Int64, window_end:Int64?, exact_day:Bool?, exact_time:Bool?
    public var status:String, probability:String
    public let video_url:String?
    
    public init(name: String, description: String, type: String, window_start: Int64, window_end: Int64?, exact_day: Bool, exact_time: Bool, status: String, probability: String, video_url: String?) {
        self.name = name
        self.description = description
        self.type = type
        self.window_start = window_start
        self.window_end = window_end
        self.exact_day = exact_day ? exact_day : nil
        self.exact_time = exact_time ? exact_time : nil
        self.status = status
        self.probability = probability
        self.video_url = video_url
    }
}