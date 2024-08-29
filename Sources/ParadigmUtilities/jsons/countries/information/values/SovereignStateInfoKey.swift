//
//  SovereignStateInfoKey.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public struct SovereignStateInfoKey : SovereignStateInformationValue {    
    public let info:SovereignStateInfo
    public var notes:String?
    public var year_of_data:Int
    public var values:[SovereignStateInfoValue], sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, year_of_data: Int, values: [SovereignStateInfoValue?], sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.year_of_data = year_of_data
        self.values = values.compactMap({ $0 })
        self.sources = sources
    }
}