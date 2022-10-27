//
//  TVShowInfo.swift
//  
//
//  Created by Evan Anderson on 10/22/22.
//

import Foundation

public struct TVShowInfo : Jsonable {
    public let id:Int, name:String, type:String, language:String, genres:[String], image:TVShowImage?, summary:String?, status:String, url:String
    public let runtime:Int?, averageRuntime:Int?, weight:Int
    public let premiered:String, ended:String?, schedule:TVShowSchedule
    public let _embedded:TVShowInfoEmbedded?
    public let officialSite:String?, webChannel:TVShowWebChannel?, externals:TVShowExternals?, network:TVShowNetwork?
    public let updated:Int64
}
