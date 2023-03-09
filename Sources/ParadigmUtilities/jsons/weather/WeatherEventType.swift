//
//  WeatherEventType.swift
//  
//
//  Created by Evan Anderson on 2/16/23.
//

import Foundation

public enum WeatherEventType : String, CaseIterable, Jsonable {
    // USA events (https://api.weather.gov/alerts/types)
    case _911_telephone_outage_emergency
    case administrative_message
    case air_quality_alert
    case air_stagnation_advisory
    case arroyo_and_small_stream_flood_advisory
    case ashfall_advisory
    case ashfall_warning
    case avalanche_advisory
    case avalanche_warning
    case avalanche_watch
    case beach_hazards_statement
    case blizzard_warning
    case blizzard_watch
    case blowing_dust_advisory
    case blowing_dust_warning
    case brisk_wind_advisory
    case child_abduction_emergency
    case civil_danger_warning
    case civil_emergency_message
    case coastal_flood_advisory
    case coastal_flood_statement
    case coastal_flood_warning
    case coastal_flood_watch
    case dense_fog_advisory
    case dense_smoke_advisory
    case dust_advisory
    case dust_storm_warning
    case earthquake_warning
    case evacuation___immediate
    case excessive_heat_warning
    case excessive_heat_watch
    case extreme_cold_warning
    case extreme_cold_watch
    case extreme_fire_danger
    case extreme_wind_warning
    case fire_warning
    case fire_weather_watch
    case flash_flood_statement
    case flash_flood_warning
    case flash_flood_watch
    case flood_advisory
    case flood_statement
    case flood_warning
    case flood_watch
    case freeze_warning
    case freeze_watch
    case freezing_fog_advisory
    case freezing_rain_advisory
    case freezing_spray_advisory
    case frost_advisory
    case gale_warning
    case gale_watch
    case hard_freeze_warning
    case hard_freeze_watch
    case hazardous_materials_warning
    case hazardous_seas_warning
    case hazardous_seas_watch
    case hazardous_weather_outlook
    case heat_advisory
    case heavy_freezing_spray_warning
    case heavy_freezing_spray_watch
    case high_surf_advisory
    case high_surf_warning
    case high_wind_warning
    case high_wind_watch
    case hurricane_force_wind_warning
    case hurricane_force_wind_watch
    case hurricane_local_statement
    case hurricane_warning
    case hurricane_watch
    case hydrologic_advisory
    case hydrologic_outlook
    case ice_storm_warning
    case lake_effect_snow_advisory
    case lake_effect_snow_warning
    case lake_effect_snow_watch
    case lake_wind_advisory
    case lakeshore_flood_advisory
    case lakeshore_flood_statement
    case lakeshore_flood_warning
    case lakeshore_flood_watch
    case law_enforcement_warning
    case local_area_emergency
    case low_water_advisory
    case marine_weather_statement
    case nuclear_power_plant_warning
    case radiological_hazard_warning
    case red_flag_warning
    case rip_current_statement
    case severe_thunderstorm_warning
    case severe_thunderstorm_watch
    case severe_weather_statement
    case shelter_in_place_warning
    case short_term_forecast
    case small_craft_advisory
    case small_craft_advisory_for_hazardous_seas
    case small_craft_advisory_for_rough_bar
    case small_craft_advisory_for_winds
    case small_stream_flood_advisory
    case snow_squall_warning
    case special_marine_warning
    case special_weather_statement
    case storm_surge_warning
    case storm_surge_watch
    case storm_warning
    case storm_watch
    case test
    case tornado_warning
    case tornado_watch
    case tropical_depression_local_statement
    case tropical_storm_local_statement
    case tropical_storm_warning
    case tropical_storm_watch
    case tsunami_advisory
    case tsunami_warning
    case tsunami_watch
    case typhoon_local_statement
    case typhoon_warning
    case typhoon_watch
    case urban_and_small_stream_flood_advisory
    case volcano_warning
    case wind_advisory
    case wind_chill_advisory
    case wind_chill_warning
    case wind_chill_watch
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
                .flood_watch,
                .freeze_watch,
                .hard_freeze_warning,
                .heavy_freezing_spray_warning,
                .high_wind_warning,
                .high_wind_watch,
                .red_flag_warning,
                .storm_warning,
                .storm_watch,
                .wind_chill_warning,
                .winter_storm_warning,
                .winter_storm_watch
            :
            return 2
        case .beach_hazards_statement,
                .dense_fog_advisory,
                .freeze_warning,
                .gale_warning,
                .gale_watch,
                .hazardous_seas_warning,
                .high_surf_warning,
                .rip_current_statement,
                .special_weather_statement,
                .wind_advisory,
                .wind_chill_advisory,
                .winter_weather_advisory
            :
            return 3
        case .brisk_wind_advisory,
                .coastal_flood_advisory,
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
                .child_abduction_emergency,
                .hydrologic_outlook
            :
            return 5
        default:
            return UInt8.max
        }
    }
    
    var name : String {
        return "WeatherEventName"
    }
}
