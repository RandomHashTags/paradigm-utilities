//
//  SovereignStateSingleValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateSingleValue : SovereignStateIdentifiableValue {    
    public let info:SovereignStateInfo
    public var notes:String?, value:String, value_description:String?
    public let year_of_data:Int
    public var sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, value: String, value_description: String?, year_of_data: Int, sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.value = value
        self.value_description = value_description
        self.year_of_data = year_of_data
        self.sources = sources
    }
}