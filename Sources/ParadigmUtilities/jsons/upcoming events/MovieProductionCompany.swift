//
//  MovieProductionCompany.swift
//  
//
//  Created by Evan Anderson on 10/10/22.
//

import Foundation

public struct MovieProductionCompany : Jsonable {
    let id:String, name:String, aliases:[String]?, description:String, imageURL:String?, sources:EventSources
}
