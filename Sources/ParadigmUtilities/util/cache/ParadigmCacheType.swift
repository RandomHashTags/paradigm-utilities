//
//  ParadigmCacheType.swift
//  
//
//  Created by Evan Anderson on 5/20/23.
//

import Foundation

public enum ParadigmCacheType : Hashable {
    /*
     Shared
     */
    case shared_instances
    case misc
    
    #if canImport(Vapor)
    /*
     Server-side
     */
    // Misc
    case server_http_headers
    case server_settings_json
    case server_ping
    // Responses
    case server_responses_home
    case server_responses_home_combined
    case server_responses_upcoming_event_movie_production_companies
    case server_responses_weather_alerts
    case server_responses_weather_event_pre_alerts
    // Countries
    case server_countries_currency_exchange
    case server_countries_country_availabilities_country_value
    case server_countries_sovereign_state_information_static
    case server_countries_sovereign_state_information_nonstatic
    case server_countries_sovereign_state_information_combined
    case server_countries_national_park
    case server_countries_volcano
    // Government
    case server_government_recent_activity
    case server_government_administration
    case server_government_administration_bill
    case server_government_administration_bills_by_status
    case server_government_administration_enacted_bills
    case server_government_administration_politician
    case server_government_administration_recent_activity
    case server_government_subdivision_statute_indexes
    case server_government_subdivision_statute_chapters
    case server_government_subdivision_statute_sections
    case server_government_subdivision_statute
    // Services
    case server_service_access_token
    // Upcoming Events
    case server_upcoming_event_server_holiday
    case server_upcoming_event_client_holiday
    case server_upcoming_event_near_holidays
    case server_upcoming_event_region_holidays
    case server_upcoming_event_weekly_events
    case server_upcoming_event_movie_production_company
    /// returned value should be ---> ParadigmCache<String, GenericUpcomingEvent>
    case server_upcoming_events_by_type
    /// returned value should be ---> ParadigmCache<String, PreUpcomingEvent>
    case server_pre_upcoming_events_by_type
    // Weather
    case server_weather_sovereign_state_pre_earthquakes
    case server_weather_earthquakes
    case server_weather_earthquake
    case server_weather_pre_alert
    case server_weather_alert
    case server_weather_event_pre_alerts
    case server_weather_subdivision_events
    case server_weather_subdivision_pre_alerts
    case server_weather_zone
    case server_weather_nasa_eonet
    case server_weather_nasa_eonet_volcano_description
    
    #else
    
    /*
     Client-side
     */
    // Misc
    case client_data_values_dictionaries
    case client_data_values_cached
    case client_system_ui_image
    case client_color_sets
    // Countries
    case client_country_filters
    case client_country_flag_url_prefix
    // Government
    case client_government_chambers
    case client_government_bill_statuses
    // Remote Notifications
    case client_remote_notification_categories
    // Upcoming Events
    case client_upcoming_event_selected_date
    case client_upcoming_event_type_priorities
    case client_upcoming_event_categories
    case client_upcoming_event_holidays
    case client_upcoming_event_pre_movie_production_companies
    case client_upcoming_event_pre_upcoming_events
    case client_upcoming_event_presentation_types
    // Weather
    case client_weather_events
    case client_weather_natural_events
    case client_weather_pre_earthquakes
    #endif
}
