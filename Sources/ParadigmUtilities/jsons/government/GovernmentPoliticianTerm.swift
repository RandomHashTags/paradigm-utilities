//
//  GovernmentPoliticianTerm.swift
//
//
//  Created by Evan Anderson on 9/17/22.
//

import Foundation
import SwiftSovereignStates

public struct GovernmentPoliticianTerm : Jsonable {
    public let position:GovernmentPoliticianPosition, start:EventDate, end:EventDate?, party:PoliticalParty, how:String?, subdivision:SovereignStateSubdivisionWrapper?, district:Int?, contactInformation:ContactInformation?
    
    public init(position: GovernmentPoliticianPosition, start: EventDate, end: EventDate?, party: PoliticalParty, how: String?, subdivision: (any SovereignStateSubdivision)?, district: Int?, contactInformation: ContactInformation?) {
        self.position = position
        self.start = start
        self.end = end
        self.party = party
        self.how = how
        self.subdivision = subdivision != nil ? SovereignStateSubdivisionWrapper(subdivision!) : nil
        self.district = district
        self.contactInformation = contactInformation
    }
}
