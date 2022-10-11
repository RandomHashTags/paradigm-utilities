//
//  ContactInformation.swift
//
//
//  Created by Evan Anderson on 9/17/22.
//

import Foundation

public struct ContactInformation : Jsonable {
    public let address:String?, office:String?, phoneNumber:String?, faxNumber:String?, contactFormURL:String?
    
    public init(address: String?, office: String?, phoneNumber: String?, faxNumber: String?, contactFormURL: String?) {
        self.address = address
        self.office = office
        self.phoneNumber = phoneNumber
        self.faxNumber = faxNumber
        self.contactFormURL = contactFormURL
    }
}
