//
//  SovereignStateInformationValue.swift
//  
//
//  Created by Evan Anderson on 10/12/22.
//

import Foundation

public protocol SovereignStateInformationValue : Jsonable {
    var sources:EventSources? { get }
}
