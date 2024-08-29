//
//  SovereignStateInformationValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

public protocol SovereignStateInformationValue : Jsonable {
    var sources:EventSources? { get }
}
