//
//  MovieProductionCompanyProtocol.swift
//  
//
//  Created by Evan Anderson on 10/19/22.
//

public protocol MovieProductionCompanyProtocol : Jsonable {
    var id : String { get }
    var name : String { get }
    var image_url : String? { get }
}
