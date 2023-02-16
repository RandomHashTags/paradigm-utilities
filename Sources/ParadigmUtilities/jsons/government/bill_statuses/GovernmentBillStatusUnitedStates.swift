//
//  GovernmentBillStatusUnitedStates.swift
//
//
//  Created by Evan Anderson on 7/17/22.
//

import Foundation
import SwiftSovereignStates

public enum GovernmentBillStatusUnitedStates : String, GovernmentBillStatus {
    case introduced
    case committee_consideration
    //case floor_consideration
    case failed_one_chamber
    case passed_one_chamber
    case passed_both_chambers
    case resolving_differences
    case to_president
    case became_law
    case vetoed
    
    public var country : Country {
        return Country.united_states
    }
    
    public var name : String {
        switch self {
        case .introduced: return "Introduced"
        case .committee_consideration: return "Committee Consideration"
        case .failed_one_chamber: return "Failed One Chamber"
        case .passed_one_chamber: return "Passed One Chamber"
        case .passed_both_chambers: return "Passed Both Chambers"
        case .resolving_differences: return "Resolving Differences"
        case .to_president: return "To President"
        case .became_law: return "Became Law"
        case .vetoed: return "Vetoed"
        }
    }
    
    public var controller_title : String {
        let prefix:String = "Legislature: "
        switch self {
        case .introduced: return prefix + "Introduced"
        case .committee_consideration: return prefix + "Committee Consideration"
        //case .floor_consideration: return prefix + "Floor Consideration"
        case .failed_one_chamber: return prefix + "Failed One Chamber"
        case .passed_one_chamber: return prefix + "Passed One Chamber"
        case .passed_both_chambers: return prefix + "Passed Both Chambers"
        case .resolving_differences: return prefix + "Resolving Differences"
        case .to_president: return prefix + "Presented to President"
        case .became_law: return prefix + "Became Law"
        case .vetoed: return prefix + "Vetoed"
        }
    }
    
    public var search_id : String {
        switch self {
        case .introduced: return "introduced"
        case .committee_consideration: return "comittee"
        //case .floor_consideration: return "floor"
        case .failed_one_chamber: return "failed-one"
        case .passed_one_chamber: return "passed-one"
        case .passed_both_chambers: return "passed-both"
        case .resolving_differences: return "resolving"
        case .to_president: return "president"
        case .became_law: return "law"
        case .vetoed: return "veto"
        }
    }
}
