//
//  SovereignStateIdentifiableValue.swift
//  
//
//  Created by Evan Anderson on 10/19/22.
//

import Foundation

public protocol SovereignStateIdentifiableValue : SovereignStateInformationValue {
    var info:SovereignStateInfo { get }
    var yearOfData:Int { get }
}
