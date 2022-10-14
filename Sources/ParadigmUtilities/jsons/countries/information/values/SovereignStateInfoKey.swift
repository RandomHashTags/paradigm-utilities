//
//  SovereignStateInfoKey.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoKey : SovereignStateInformationValue {
    public let type:SovereignStateInformationType, info:SovereignStateInfo, notes:String?, yearOfData:Int, values:[SovereignStateInfoValue], sources:EventSources?
    
    public init(type: SovereignStateInformationType, info: SovereignStateInfo, notes: String?, yearOfData: Int, values: [SovereignStateInfoValue], sources: EventSources?) {
        self.type = type
        self.info = info
        self.notes = notes
        self.yearOfData = yearOfData
        self.values = values
        self.sources = sources
    }
}
