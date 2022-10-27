//
//  UpcomingEventValueCellType.swift
//
//
//  Created by Evan Anderson on 6/15/22.
//

import Foundation

public enum UpcomingEventValueCellType : String, CaseIterable, JsonableNoTranslationKeys {
    case audio
    case label
    case label_expandable
    case label_header
    case production_companies
    case spotify_tracks
    case ticketmaster_venue
    case video_url
}
