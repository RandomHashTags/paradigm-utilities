//
//  ClientWikipediaEvent.swift
//
//
//  Created by RandomHashTags on 6/28/22.
//

import Foundation
import SwiftSovereignStates

public struct ClientWikipediaEvent {
    public let images:[String]?, description:String, hyperlinks:ClientHyperlinks?, countries:[Country]?, subdivisions:[SovereignStateSubdivisionWrapper]?, tags:[String]?, sources:EventSources?
}
