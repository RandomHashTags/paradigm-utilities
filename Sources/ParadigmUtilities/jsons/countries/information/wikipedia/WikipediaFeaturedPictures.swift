//
//  WikipediaFeaturedPictures.swift
//  
//
//  Created by Evan Anderson on 10/16/22.
//

import Foundation

public struct WikipediaFeaturedPictures : SovereignStateInformationValue {
    public typealias ValueKeys = WikipediaFeaturedPicturesValueKeys
    
    public let imageURLPrefix:String
    public var pictures:[WikipediaPicture], sources:EventSources?
    
    public init(imageURLPrefix: String, pictures: [WikipediaPicture], sources: EventSources?) {
        self.imageURLPrefix = imageURLPrefix
        self.pictures = pictures
        self.sources = sources
    }
    
    public func getKeyValue(key: WikipediaFeaturedPicturesValueKeys) -> Any? {
        switch key {
        case .imageURLPrefix: return imageURLPrefix
        case .pictures: return pictures
        case .sources: return sources
        }
    }
    public mutating func setKeyValue<T>(key: WikipediaFeaturedPicturesValueKeys, value: T) {
        switch key {
        case .pictures:
            pictures = value as! [WikipediaPicture]
            break
        case .sources:
            sources = value as? EventSources
            break
        default:
            break
        }
    }
}

public enum WikipediaFeaturedPicturesValueKeys : String, JsonableValueKeys {
    case imageURLPrefix
    case pictures
    case sources
    
    public func isTranslatable() -> Bool {
        switch self {
        case .pictures, .sources:
            return true
        default:
            return false
        }
    }
}
