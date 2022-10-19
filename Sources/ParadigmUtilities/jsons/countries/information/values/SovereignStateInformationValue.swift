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

/*
public struct SovereignStateInformationValueProtocolWrapper : SovereignStateInformationValue {
    public let sources:EventSources?
    
    public init(info: SovereignStateInfo, sources: EventSources?) {
        self.info = info
        self.sources = sources
    }
}
*/
