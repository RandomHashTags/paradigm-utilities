//
//  UpcomingEventType.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

import Foundation
import ZippyJSON

public enum UpcomingEventType : String, CaseIterable, Jsonable {
    case astronomy_picture_of_the_day
    case earth_observatory_image_of_the_day
    case joke_of_the_day
    case movie
    case music_album
    
    case presentations
    
    case science_year_review
    case space_event
    case space_lunar_eclipse
    case space_near_earth_object
    case space_rocket_launch
    
    case sport_championships
    case sport_mlb
    case sport_nfl
    case sport_ufc
    case sport_professional_wrestling
    case spotify_new_music_friday
    
    case ticketmaster_music_event
    case tv_show
    case video_game
    case video_game_events
    case wikipedia_todays_featured_picture
    case word_of_the_day
    
    public func getPriority(widget: Bool) -> Int {
        if widget {
            switch self {
            case .space_lunar_eclipse:                return 1
            case .spotify_new_music_friday:           return 2
            case .presentations:                      return 3
            case .movie:                              return 4
            case .video_game:                         return 5
            case .space_event:                        return 6
            case .space_near_earth_object:            return 7
            case .space_rocket_launch:                return 8
            case .music_album:                        return 9
            case .sport_professional_wrestling:       return 10
            case .sport_ufc:                          return 11
            case .sport_mlb:                          return 12
            case .sport_nfl:                          return 13
            case .astronomy_picture_of_the_day:       return 14
            case .earth_observatory_image_of_the_day: return 15
            case .science_year_review:                return 16
            case .wikipedia_todays_featured_picture:  return 17
            case .word_of_the_day:                    return 18
            case .joke_of_the_day:                    return 19
            case .sport_championships:                return 20
            case .video_game_events:                  return 21
            case .ticketmaster_music_event:           return 22
            case .tv_show:                            return 23
            }
        } else {
            switch self {
            case .astronomy_picture_of_the_day:       return 1
            case .earth_observatory_image_of_the_day: return 2
            case .wikipedia_todays_featured_picture:  return 3
            case .word_of_the_day:                    return 4
            case .joke_of_the_day:                    return 5
            case .space_lunar_eclipse:                return 6
            case .spotify_new_music_friday:           return 7
            case .presentations:                      return 8
            case .science_year_review:                return 9
            case .sport_mlb:                          return 10
            case .sport_nfl:                          return 11
            case .sport_professional_wrestling:       return 12
            case .sport_ufc:                          return 13
            case .movie:                              return 14
            case .video_game:                         return 15
            case .space_event:                        return 16
            case .space_near_earth_object:            return 17
            case .space_rocket_launch:                return 18
            case .music_album:                        return 19
            case .sport_championships:                return 20
            case .video_game_events:                  return 21
            case .ticketmaster_music_event:           return 22
            case .tv_show:                            return 23
            }
        }
    }
    
    public func getImageURLPrefix() -> String? {
        switch self {
        case .astronomy_picture_of_the_day:
            return "https://apod.nasa.gov/apod/image/"
        case .earth_observatory_image_of_the_day:
            return "https://eoimages.gsfc.nasa.gov/images/imagerecords/"
        case .joke_of_the_day:
            return "https://jokes.one/img/joke_of_the_day.jpg"
        case .movie:
            return "https://m.media-amazon.com/images/"
        case .music_album,
                .science_year_review,
                .space_lunar_eclipse,
                .sport_championships,
                .sport_ufc,
                .sport_professional_wrestling,
                .video_game:
            return "https://upload.wikimedia.org/wikipedia/"
        case .space_event,
                .space_rocket_launch:
            return "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/"
        case .spotify_new_music_friday:
            return "https://i.scdn.co/image/"
        case .ticketmaster_music_event:
            return "https://s1.ticketm.net/dam/"
        case .tv_show:
            return "https://static.tvmaze.com/uploads/images/original_untouched/"
        case .video_game_events:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1e/CDL_Logo.svg/1000px-CDL_Logo.svg.png"
        case .word_of_the_day:
            return "https://www.trendingpod.com/wp-content/uploads/2017/12/1200px-Merriam-Webster_logo-1024x1024.png"
        default:
            return nil
        }
    }
    
    public func getName(singular: Bool) -> String {
        if singular {
            switch self {
            case .astronomy_picture_of_the_day: return "Astronomy Picture of the Day"
            case .earth_observatory_image_of_the_day: return "Earth Observatory Image of the Day"
            case .joke_of_the_day: return "Joke of the Day"
            case .movie: return "Movie Release"
            case .music_album: return "Music Album"
            case .presentations: return "Presentation"
            case .science_year_review: return "Today in Science"
            case .space_event: return "Space Event"
            case .space_lunar_eclipse: return "Lunar Eclipse"
            case .space_near_earth_object: return "Near Earth Object"
            case .space_rocket_launch: return "Rocket Launch"
            case .sport_championships: return "Championship"
            case .sport_mlb: return "MLB Event"
            case .sport_nfl: return "NFL Event"
            case .sport_ufc: return "UFC Event"
            case .sport_professional_wrestling: return "Professional Wrestling"
            case .spotify_new_music_friday: return "Spotify New Music Friday"
            case .ticketmaster_music_event: return "Music Event"
            case .tv_show: return "TV Show"
            case .video_game: return "Video Game Release"
            case .video_game_events: return "Video Game Event"
            case .wikipedia_todays_featured_picture: return "Wikipedia: Today's Featured Picture"
            case .word_of_the_day: return "Word of the Day"
            }
        } else {
            switch self {
            case .astronomy_picture_of_the_day: return "Astronomy Pictures of the Day"
            case .earth_observatory_image_of_the_day: return "Earth Observatory Images of the Day"
            case .joke_of_the_day: return "Jokes of the Day"
            case .movie: return "Movie Releases"
            case .music_album: return "Music Album Releases"
            case .presentations: return "Presentations"
            case .science_year_review: return "Today in Science"
            case .space_event: return "Space Events"
            case .space_lunar_eclipse: return "Lunar Eclipses"
            case .space_near_earth_object: return "Near Earth Objects"
            case .space_rocket_launch: return "Rocket Launches"
            case .sport_championships: return "Championships"
            case .sport_mlb: return "MLB Schedule"
            case .sport_nfl: return "NFL Schedule"
            case .sport_ufc: return "UFC Schedule"
            case .sport_professional_wrestling: return "Professional Wrestling"
            case .spotify_new_music_friday: return "Spotify New Music Friday"
            case .ticketmaster_music_event: return "Music Events"
            case .tv_show: return "TV Shows"
            case .video_game: return "Vide Game Releases"
            case .video_game_events: return "Video Game Events"
            case .wikipedia_todays_featured_picture: return "Wikipedia: Today's Featured Pictures"
            case .word_of_the_day: return "Words of the Day"
            }
        }
    }
    public func getNotificationDescription(singular: Bool) -> String {
        if singular {
            switch self {
            case .astronomy_picture_of_the_day: return "\"%title%\" is today's APOD!"
            case .earth_observatory_image_of_the_day: return "\"%title%\" is today's Earth Observatory Image of the Day!"
            case .joke_of_the_day: return "Joke of the day: %title%"
            case .movie: return "\"%title%\" is making its cinematic debut today!"
            case .music_album: return "\"%title%\" by %artist% releases today!"

            case .presentations: return "%title% is happening today!"

            case .science_year_review: return "See what happened today in the past with Today in Science!"
            case .space_event: return "%title% is scheduled today!"
            case .space_lunar_eclipse: return "%title% is happening today!"
            case .space_near_earth_object: return "A near earth object is close by!"
            case .space_rocket_launch: return "%title% is scheduled to take off today!"
            case .sport_championships: return "%title% begins today!"
            case .sport_mlb: return "%team% has a game today!"
            case .sport_nfl: return "%team% has a game today!"
            case .sport_ufc: return "%title% is tonight!"
            case .sport_professional_wrestling: return "%title% is tonight!"
            case .spotify_new_music_friday: return "Spotify's New Music Friday has been updated!"

            case .ticketmaster_music_event: return "\"%title%\" happens tonight!"
            case .tv_show: return "A new episode for \"%title%\" is now available!"
            case .video_game: return "\"%title%\" releases today!"
            case .video_game_events: return "\"%title%\" is today!"
            case .wikipedia_todays_featured_picture: return "Today's Wikipedia Featured Picture is \"%title%\"!"
            case .word_of_the_day: return "Today's Word of the Day is \"%title%\"!"
            }
        } else {
            switch self {
            case .astronomy_picture_of_the_day: return "\"%title%\" are today's APODs!"
            case .earth_observatory_image_of_the_day: return "\"%title%\" are today's Earth Observatory Images of the Day!"
            case .joke_of_the_day: return "Jokes of the Day: %title%"
            case .movie: return "\"%title%\" are making their cinematic debut today!"
            case .music_album: return "\"%title%\" by %artist% releases today!"

            case .presentations: return "%title% are happening today!"

            case .science_year_review: return "See what happened today in the past with Today in Science!"
            case .space_event: return "%title% are scheduled today!"
            case .space_lunar_eclipse: return "%title% are happening today!"
            case .space_near_earth_object: return "Near earth objects are close by!"
            case .space_rocket_launch: return "%title% are scheduled to take off today!"
            case .sport_championships: return "%title% begins today!"
            case .sport_mlb: return "%team% have games today!"
            case .sport_nfl: return "%team% have games today!"
            case .sport_ufc: return "%title% are tonight!"
            case .sport_professional_wrestling: return "%title% are tonight!"
            case .spotify_new_music_friday: return "Spotify's New Music Friday has been updated!"

            case .ticketmaster_music_event: return "\"%title%\" happens tonight!"
            case .tv_show: return "New episodes for \"%title%\" are now available!"
            case .video_game: return "\"%title%\" release today!"
            case .video_game_events: return "\"%title%\" are today!"
            case .wikipedia_todays_featured_picture: return "Today's Wikipedia Featured Pictures are \"%title%\"!"
            case .word_of_the_day: return "Today's Words of the Day are \"%title%\"!"
            }
        }
    }
    
    public func getCodingKeys() -> [any UpcomingEventCodingKeys]? {
        switch self {
        case .astronomy_picture_of_the_day: return APODEventCodingKeys.allCases
        case .joke_of_the_day: return JOTDEventCodingKeys.allCases
        case .movie: return MovieEventCodingKeys.allCases
        case .music_album: return MusicAlbumEventCodingKeys.allCases
        case .science_year_review: return ScienceYearReviewEventCodingKeys.allCases
        case .space_event: return SpaceEventCodingKeys.allCases
        case .space_lunar_eclipse: return SpaceLunarEclipseEventCodingKeys.allCases
        case .space_near_earth_object: return SpaceNearEarthObjectEventCodingKeys.allCases
        case .space_rocket_launch: return SpaceRocketLaunchEventCodingKeys.allCases
        case .sport_professional_wrestling: return ProfessionalWrestlingEventCodingKeys.allCases
        case .spotify_new_music_friday: return SpotifyNewMusicFridayEventCodingKeys.allCases
        case .ticketmaster_music_event: return TicketmasterMusicEventCodingKeys.allCases
        case .video_game: return VideoGameEventCodingKeys.allCases
        case .word_of_the_day: return WOTDEventCodingKeys.allCases
        default: return nil
        }
    }
}
