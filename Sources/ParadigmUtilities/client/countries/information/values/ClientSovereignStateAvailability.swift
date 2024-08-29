//
//  ClientSovereignStateAvailability.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct ClientSovereignStateAvailability : Jsonable {    
    public let info:SovereignStateInfo, primary_category:SovereignStateAvailabilityCategory, image_url:String?, value:Bool
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, primary_category: SovereignStateAvailabilityCategory, image_url: String?, value: Bool, sources: EventSources?) {
        self.info = info
        self.primary_category = primary_category
        self.image_url = image_url
        self.value = value
        self.sources = sources
    }
}