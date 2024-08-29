//
//  ContactInformation.swift
//
//
//  Created by Evan Anderson on 9/17/22.
//

public struct ContactInformation : Jsonable {
    public let address:String?, office:String?, phone_number:String?, fax_number:String?, contact_form_url:String?
    
    public init(address: String?, office: String?, phone_number: String?, fax_number: String?, contact_form_url: String?) {
        self.address = address
        self.office = office
        self.phone_number = phone_number
        self.fax_number = fax_number
        self.contact_form_url = contact_form_url
    }
}
