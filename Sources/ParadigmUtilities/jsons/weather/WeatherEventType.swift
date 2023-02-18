//
//  WeatherEventType.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

import Foundation

public enum WeatherEventType : String, CaseIterable, Jsonable {
    // USA events (https://api.weather.gov/alerts/types)
    case air_quality_alert
    case avalanche_warning
    case avalanche_watch
    case beach_hazrds_statement
    case blizzard_warning
    case brisk_wind_advisory
    case dense_fog_advisory
    case fire_weather_watch
    case flash_flood_warning
    case flood_advisory
    case flood_warning
    case freeze_warning
    case freeze_watch
    case frost_advisory
    case gale_warning
    case gale_watch
    case hard_freeze_warning
    case heavy_freezing_spray_warning
    case high_surf_advisory
    case high_wind_warning
    case high_wind_watch
    case hydrologic_outlook
    case lakeshore_flood_advisory
    case low_water_advisory
    case marine_weather_statement
    case red_flag_warning
    case rip_current_statement
    case small_craft_advisory
    case special_weather_advisory
    case special_weather_statement
    case storm_warning
    case tornado_warning
    case tornado_watch
    case wind_advisory
    case wind_chill_advisory
    case wind_chill_warning
    case winter_storm_warning
    case winter_storm_watch
    case winter_weather_advisory
    
    var defcon : UInt8 {
        switch self {
        case .blizzard_warning,
                .tornado_warning,
                .tornado_watch
            :
            return 1
        case .fire_weather_watch,
                .flash_flood_warning,
                .flood_warning,
                .freeze_watch,
                .hard_freeze_warning,
                .heavy_freezing_spray_warning,
                .high_wind_warning,
                .high_wind_watch,
                .red_flag_warning,
                .storm_warning,
                .wind_chill_warning,
                .winter_storm_warning,
                .winter_storm_watch
            :
            return 2
        case .dense_fog_advisory,
                .freeze_warning,
                .gale_warning,
                .gale_watch,
                .rip_current_statement,
                .special_weather_advisory,
                .special_weather_statement,
                .wind_advisory,
                .wind_chill_advisory,
                .winter_weather_advisory
            :
            return 3
        case .beach_hazrds_statement,
                .brisk_wind_advisory,
                .flood_advisory,
                .frost_advisory,
                .high_surf_advisory,
                .lakeshore_flood_advisory,
                .low_water_advisory,
                .marine_weather_statement,
                .small_craft_advisory
            :
            return 4
        case .air_quality_alert,
                .avalanche_warning,
                .avalanche_watch,
                .hydrologic_outlook
            :
            return 5
        }
    }
    
    var name : String {
        return "WeatherEventName"
    }
}
