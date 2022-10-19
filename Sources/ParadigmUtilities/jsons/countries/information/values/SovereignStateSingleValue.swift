//
//  SovereignStateSingleValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateSingleValue : SovereignStateInformationValue {
    public let info:SovereignStateInfo, notes:String?, value:String, valueDescription:String?, yearOfData:Int, sources:EventSources?
    
    public init(info: SovereignStateInfo, notes: String?, value: String, valueDescription: String?, yearOfData: Int, sources: EventSources?) {
        self.info = info
        self.notes = notes
        self.value = value
        self.valueDescription = valueDescription
        self.yearOfData = yearOfData
        self.sources = sources
    }
}
