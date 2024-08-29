//
//  SovereignStateIdentifiableValue.swift
//  
//
//  Created by Evan Anderson on 10/19/22.
//

public protocol SovereignStateIdentifiableValue : SovereignStateInformationValue {
    var info:SovereignStateInfo { get }
    var year_of_data:Int { get }
}
