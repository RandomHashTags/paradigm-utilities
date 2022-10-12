//
//  SovereignStateSingleValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateSingleValue : SovereignStateInformationValueProtocol {
    public let notes:String?, value:String, valueDescription:String?, yearOfData:Int
    
    public init(notes: String?, value: String, valueDescription: String?, yearOfData: Int) {
        self.notes = notes
        self.value = value
        self.valueDescription = valueDescription
        self.yearOfData = yearOfData
    }
}
