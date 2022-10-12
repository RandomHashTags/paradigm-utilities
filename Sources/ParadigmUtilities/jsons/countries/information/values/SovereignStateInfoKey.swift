//
//  SovereignStateInfoKey.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public struct SovereignStateInfoKey : SovereignStateInformationValueProtocol {
    public let notes:String?, yearOfData:Int, values:[SovereignStateInfoValue]
    
    public init(notes: String?, yearOfData: Int, values: [SovereignStateInfoValue]) {
        self.notes = notes
        self.yearOfData = yearOfData
        self.values = values
    }
}
