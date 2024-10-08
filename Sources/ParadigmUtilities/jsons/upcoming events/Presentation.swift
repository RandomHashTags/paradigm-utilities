//
//  Presentation.swift
//  
//
//  Created by Evan Anderson on 10/15/22.
//

public enum Presentation : String, CaseIterable, Jsonable {
    case apple_event
    case apple_event_wwdc
    case arm_devsummit
    case blizzcon
    case coachella
    case e3
    case game_developers_conference
    case golden_globe_awards
    case golden_joystick_awards
    case google_io
    case grammy_awards
    case met_gala
    case minecraft
    case mtv_video_music_awards
    case nintendo_direct
    case nvidia_gtc
    case steam_awards
    case the_game_awards
    case twitchcon
    case web_summit
    
    public var url : String {
        switch self {
        case .apple_event: return "https://www.apple.com/apple-events/"
        case .apple_event_wwdc: return "https://en.wikipedia.org/wiki/Apple_Worldwide_Developers_Conference"
        case .arm_devsummit: return "https://en.wikipedia.org/wiki/ARM_DevSummit"
        case .blizzcon: return "https://en.wikipedia.org/wiki/BlizzCon"
        case .coachella: return "https://en.wikipedia.org/wiki/Coachella_Valley_Music_and_Arts_Festival"
        case .e3: return "https://en.wikipedia.org/wiki/E3"
        case .game_developers_conference: return "https://en.wikipedia.org/wiki/Game_Developers_Conference"
        case .golden_globe_awards: return "https://en.wikipedia.org/wiki/List_of_Golden_Globe_Awards_ceremonies"
        case .golden_joystick_awards: return "https://en.wikipedia.org/wiki/Golden_Joystick_Awards"
        case .google_io: return "https://en.wikipedia.org/wiki/Google_I/O"
        case .grammy_awards: return "https://en.wikipedia.org/wiki/Grammy_Awards"
        case .met_gala: return "https://en.wikipedia.org/wiki/Met_Gala"
        case .minecraft: return "https://en.wikipedia.org/wiki/Minecon"
        case .mtv_video_music_awards: return "https://en.wikipedia.org/wiki/MTV_Video_Music_Awards"
        case .nintendo_direct: return "https://en.wikipedia.org/wiki/Nintendo_Direct"
        case .nvidia_gtc: return "https://en.wikipedia.org/wiki/Nvidia_GTC"
        case .steam_awards: return "https://en.wikipedia.org/wiki/Steam_Awards"
        case .the_game_awards: return "https://en.wikipedia/wiki/The_Game_Awards"
        case .twitchcon: return "https://en.wikipedia.org/wiki/TwitchCon"
        case .web_summit: return "https://en.wikipedia.org/wiki/Web_Summit"
        }
    }
    public var url_site_name : String {
        switch self {
        case .apple_event: return "Apple: Apple Events"
        default:
            return "Wikipedia: " + url.split(separator: "/").last!.replacingOccurrences(of: "_", with: " ")
        }
    }
    
    public var type : PresentationType {
        switch self {
        case .apple_event: return .presentation
        case .apple_event_wwdc: return .conference_developer
        case .arm_devsummit: return .conference_developer
        case .blizzcon: return .convention_gaming
        case .coachella: return .festival_music
        case .e3: return .expo_gaming
        case .game_developers_conference: return .conference
        case .golden_globe_awards: return .award_ceremony
        case .golden_joystick_awards: return .award_ceremony
        case .google_io: return .conference_developer
        case .grammy_awards: return .award_ceremony
        case .met_gala: return .exhibit_fashion
        case .minecraft: return .convention_gaming
        case .mtv_video_music_awards: return .award_ceremony
        case .nintendo_direct: return .presentation
        case .nvidia_gtc: return .conference_developer
        case .steam_awards: return .award_ceremony
        case .the_game_awards: return .award_ceremony
        case .twitchcon: return .convention_gaming
        case .web_summit: return .conference
        }
    }
    
    public var name : String {
        switch self {
        case .apple_event: return "Apple Event"
        case .apple_event_wwdc: return "WWDC"
        case .arm_devsummit: return "Arm DevSummit"
        case .blizzcon: return "BlizzCon"
        case .coachella: return "Coachella"
        case .e3: return "E3"
        case .game_developers_conference: return "Game Developers Conference"
        case .golden_globe_awards: return "Golden Globe Awards"
        case .golden_joystick_awards: return "Golden Joystick Awards"
        case .google_io: return "Google I/O"
        case .grammy_awards: return "Grammy Awards"
        case .met_gala: return "Met Gala"
        case .minecraft: return "Minecraft Events"
        case .mtv_video_music_awards: return "MTV Video Music Awards"
        case .nintendo_direct: return "Nintendo Direct"
        case .nvidia_gtc: return "Nvidia GTC"
        case .steam_awards: return "Steam Awards"
        case .the_game_awards: return "The Game Awards"
        case .twitchcon: return "TwitchCon"
        case .web_summit: return "Web Summit"
        }
    }
    public var aliases : [String]? {
        switch self {
        case .apple_event_wwdc:
            return ["Worldwide Developers Conference"]
        case .arm_devsummit:
            return ["DevCon", "Arm TechCon"]
        case .golden_joystick_awards:
            return ["People's Gaming Awards"]
        case .grammy_awards:
            return ["GRAMMY", "Gramophone Award", "Grammy"]
        case .minecraft:
            return ["MineCon", "Minecraft Live", "Minecraft Festival"]
        case .mtv_video_music_awards:
            return ["VMAs"]
        case .nvidia_gtc:
            return ["Nvidia GPU Technology Conference"]
        default:
            return nil
        }
    }
    
    public var default_image_url : String? {
        switch self {
        case .apple_event:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/%quality%px-Apple_logo_black.svg.png"
        case .apple_event_wwdc:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Apple_WWDC_wordmark.svg/%quality%px-Apple_WWDC_wordmark.svg.png"
        case .arm_devsummit:
            return nil
        case .blizzcon:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/5/51/BlizzCon_logo.svg/%quality%px-BlizzCon_logo.svg.png"
        case .coachella:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Coachella_Valley_Music_and_Arts_Festival_logo.svg/%quality%px-Coachella_Valley_Music_and_Arts_Festival_logo.svg.png"
        case .e3:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/E3_Logo.svg/%quality%px-E3_Logo.svg.png"
        case .game_developers_conference:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Game_Developers_Conference_logo.svg/%quality%px-Game_Developers_Conference_logo.svg.png"
        case .golden_globe_awards:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/0/09/Golden_Globe_Trophy.jpg/%quality%px-Golden_Globe_Trophy.jpg"
        case .golden_joystick_awards:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Golden_Joystick_Award_%28Award_Cup%29.svg/%quality%px-Golden_Joystick_Award_%28Award_Cup%29.svg.png"
        case .google_io:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_IO_logo.svg/%quality%px-Google_IO_logo.svg.png"
        case .grammy_awards:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/7/77/Grammy_Award_2002.jpg/%quality%px-Grammy_Award_2002.jpg"
        case .met_gala:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/The_MET.jpg/%quality%px-The_MET.jpg"
        case .minecraft:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/3/3a/Minecon_logo.png/%quality%px-Minecon_logo.png"
        case .mtv_video_music_awards:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/c/c5/Mtv_moon_man.jpg/%quality%px-Mtv_moon_man.jpg"
        case .nintendo_direct:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Nintendo_Direct_logo.svg/%quality%px-Nintendo_Direct_logo.svg.png"
        case .nvidia_gtc:
            return nil
        case .steam_awards:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/7/74/SteamAwardslogo.png/%quality%px-SteamAwardslogo.png"
        case .the_game_awards:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/6/67/The_Game_Awards_logo_2020.svg/%quality%px-The_Game_Awards_logo_2020.svg.png"
        case .twitchcon:
            return "https://upload.wikimedia.org/wikipedia/en/thumb/d/d4/Twitchcon_logo.svg/%quality%px-Twitchcon_logo.svg.png"
        case .web_summit:
            return "https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Logo_Lisbon_Web_Summit.svg/%quality%px-Logo_Lisbon_Web_Summit.svg.png"
        }
    }
}
