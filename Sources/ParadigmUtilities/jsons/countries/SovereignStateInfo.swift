//
//  SovereignStateInfo.swift
//
//
//  Created by Evan Anderson on 6/16/22.
//

import Foundation

public enum SovereignStateInfo : String, CaseIterable, Jsonable {
    case agriculture_food_apple_production
    case agriculture_food_apricot_production
    case agriculture_food_artichoke_production
    case agriculture_food_avocado_production
    case agriculture_food_cherry_production
    case agriculture_food_coconut_production
    case agriculture_food_coffee_production
    case agriculture_food_cucumber_production
    case agriculture_food_eggplant_production
    case agriculture_food_garlic_production
    case agriculture_food_grape_production
    case agriculture_food_papaya_production
    case agriculture_food_pear_production
    case agriculture_food_pineapple_production
    case agriculture_food_plum_production
    case agriculture_food_potato_production
    case agriculture_food_soybean_production
    case agriculture_food_tomato_production
    case agriculture_renewable_electricity_production
    
    case availability_apple_icloud_plus
    case availability_apple_icloud_hide_my_email
    case availability_apple_ios_card
    case availability_apple_ios_carplay
    case availability_apple_ios_pay
    case availability_apple_one
    case availability_apple_ios_app_store_apps
    case availability_apple_ios_app_store_games
    case availability_apple_ios_arcade
    case availability_apple_ios_health_blood_glucose_highlights
    case availability_apple_ios_health_download_health_records_to_iphone
    case availability_apple_ios_health_share_health_app_data_with_healthcare_providers
    case availability_apple_ios_itunes_store_movies
    case availability_apple_ios_itunes_store_music
    case availability_apple_ios_itunes_store_ringtones_and_tones
    case availability_apple_ios_itunes_store_tv_shows
    case availability_apple_ios_maps_congestion_zones
    case availability_apple_ios_maps_directions
    case availability_apple_ios_maps_speed_cameras
    case availability_apple_ios_maps_speed_limits
    case availability_apple_ios_maps_nearby
    case availability_apple_ios_music
    case availability_apple_ios_siri
    case availability_apple_ios_tv_app
    case availability_apple_ios_tv_plus
    case availability_apple_ios_podcasts
    case availability_apple_ios_news
    case availability_apple_ios_news_audio
    case availability_apple_ios_news_plus
    
    case availability_apple_watch_os_apple_music
    case availability_apple_watch_os_apple_pay
    case availability_apple_watch_os_blood_oxygen_app
    case availability_apple_watch_os_ecg
    case availability_apple_watch_os_irregular_rhythm_notifications
    case availability_apple_watch_os_radio
    case availability_apple_watch_os_siri
    case availability_apple_watch_os_student_id_cards
    case availability_apple_watch_os_walkie_talkie
    
    case availabilities
    case availability_alexa
    case availability_amc_plus
    case availability_at_and_t_tv
    case availability_dazn
    case availability_discovery_plus
    case availability_disney_plus
    case availability_espn_plus
    case availability_google_assistant
    case availability_google_pay
    case availability_google_play_pass
    case availability_hbo_max
    case availability_hulu
    case availability_nvidia_geforce_now
    case availability_paramount_plus
    case availability_peacock
    case availability_playstation_now
    case availability_samsung_pay
    case availability_showtime
    case availability_spotify
    case availability_stadia
    case availability_starz
    case availability_starzplay
    case availability_tidal
    case availability_venmo
    case availability_xbox_cloud_gaming
    case availability_xbox_game_pass
    case availability_xbox_live
    case availability_youtube_premium
    case availability_youtube_tv
    
    case geography_volcanoes
 
    case info_age_structure
    case info_blood_type_distribution
    case info_median_age
    case info_minimum_annual_leave
    case info_minimum_wage
    
    case legality_abortion
    case legality_bitcoin
    case legality_cannabis
    case legality_drinking_age
    case legality_drug_ayahuasca
    case legality_drug_cocaine
    case legality_drug_ibogaine
    case legality_drug_meth
    case legality_drug_psilocybin_mushrooms
    case legality_drug_psychoactive_cactus
    case legality_drug_salvia_divinorum
    case legality_guns
    case legality_incest
    case legality_marital_rape
    case legality_pornography
    case legality_prostitution
    case legality_smoking_age
    
    case national_animals
    case national_anthem
    case national_birds
    case national_capital
    case national_parks
    case national_trees
    
    case neighbors
    
    case ranking_adult_hiv_prevalence
    case ranking_alcohol_consumption
    case ranking_cannabis_use
    case ranking_civilian_firearms
    case ranking_climate_change_performance_index
    case ranking_co2_emissions
    case ranking_corruption_perception_index
    case ranking_democracy_index
    case ranking_divorce_rate
    case ranking_economic_freedom_index
    case ranking_education_index
    case ranking_electricity_consumption
    case ranking_employment_rate
    case ranking_exports
    case ranking_external_debt
    case ranking_fragile_state_index
    case ranking_freedom_rankings
    case ranking_global_peace_index
    case ranking_global_terrorism_index
    case ranking_health_care_cost
    case ranking_home_ownership_rate
    case ranking_homicide_rate
    case ranking_human_development_index
    case ranking_imports
    case ranking_incarceration_rate
    case ranking_infant_mortality_rate
    case ranking_inflation_rate
    case ranking_internet_connection_speeds
    case ranking_legatum_prosperity_index
    case ranking_life_expectancy
    case ranking_maternal_mortality_rate
    case ranking_military_expenditures
    case ranking_natural_disaster_risk
    case ranking_number_of_billionaires
    case ranking_number_of_millionaires
    case ranking_obesity_rate
    case ranking_population
    case ranking_press_freedom_index
    case ranking_quality_of_life_index
    case ranking_quality_of_nationality
    case ranking_social_progress_index
    case ranking_suicide_rate
    case ranking_tariff_rate
    case ranking_unemployment_rate
    case ranking_wealth_per_adult
    case ranking_workforce
    case ranking_workforce_productivity
    case ranking_world_giving_index
    case ranking_world_happiness_report
    
    case service_apple_ios_maps_flyover
    case service_cia_values
    case service_sovereign_state_history
    case service_country_events
    case service_travel_advisories
    case service_wikipedia
    case service_wikipedia_featured_pictures
    
    case value_health_care_system
    case value_military_enlistment_age
    case value_minimum_driving_age
    case value_system_of_government
    case value_traffic_side
    case value_voting_age
    
    public var name : String {
        switch self {
        case .agriculture_food_apple_production: return "Apple Production"
        case .agriculture_food_apricot_production: return "Apricot Production"
        case .agriculture_food_artichoke_production: return "Artichoke Production"
        case .agriculture_food_avocado_production: return "Avocado Production"
        case .agriculture_food_cherry_production: return "Cherry Production"
        case .agriculture_food_coconut_production: return "Coconut Production"
        case .agriculture_food_coffee_production: return "Coffee Production"
        case .agriculture_food_cucumber_production: return "Cucumber Production"
        case .agriculture_food_eggplant_production: return "Eggplant Production"
        case .agriculture_food_garlic_production: return "Garlic Production"
        case .agriculture_food_grape_production: return "Grape Production"
        case .agriculture_food_papaya_production: return "Papaya Production"
        case .agriculture_food_pear_production: return "Pear Production"
        case .agriculture_food_pineapple_production: return "Pineapple Production"
        case .agriculture_food_plum_production: return "Plum Production"
        case .agriculture_food_potato_production: return "Potato Production"
        case .agriculture_food_soybean_production: return "Soybean Production"
        case .agriculture_food_tomato_production: return "Tomato Production"
        case .agriculture_renewable_electricity_production: return "Renewable Electricity Production"
        
        case .availability_apple_icloud_plus: return "Apple: iCloud+"
        case .availability_apple_icloud_hide_my_email: return "Apple: iCloud: Hide My Email"
        case .availability_apple_ios_card: return "Apple Card"
        case .availability_apple_ios_carplay: return "Apple CarPlay"
        case .availability_apple_ios_pay: return "Apple Pay"
        case .availability_apple_one: return "Apple One Bundle"
        case .availability_apple_ios_app_store_apps: return "Apple App Store: Apps"
        case .availability_apple_ios_app_store_games: return "Apple App Store: Games"
        case .availability_apple_ios_arcade: return "Apple Arcade"
        case .availability_apple_ios_health_blood_glucose_highlights: return "Apple: Health: Blood Glucose Highlights"
        case .availability_apple_ios_health_download_health_records_to_iphone: return "Apple: Health: Download Health Records to iPhone"
        case .availability_apple_ios_health_share_health_app_data_with_healthcare_providers: return "Apple: Health: Share Health App Data with healthcare Providers"
        case .availability_apple_ios_itunes_store_movies: return "Apple: iTunes Store: Movies"
        case .availability_apple_ios_itunes_store_music: return "Apple: iTunes Store: Music"
        case .availability_apple_ios_itunes_store_ringtones_and_tones: return "Apple: iTunes Store: Ringtones & Tones"
        case .availability_apple_ios_itunes_store_tv_shows: return "Apple: iTunes Store: TV Shows"
        case .availability_apple_ios_maps_congestion_zones: return "Apple Maps: Congestion Zones"
        case .availability_apple_ios_maps_directions: return "Apple Maps: Directions"
        case .availability_apple_ios_maps_speed_cameras: return "Apple Maps: Speed Cameras"
        case .availability_apple_ios_maps_speed_limits: return "Apple Maps: Speed Limits"
        case .availability_apple_ios_maps_nearby: return "Apple Maps: Nearby"
        case .availability_apple_ios_music: return "Apple Music"
        case .availability_apple_ios_siri: return "Apple Siri"
        case .availability_apple_ios_tv_app: return "Apple TV App"
        case .availability_apple_ios_tv_plus: return "Apple TV+"
        case .availability_apple_ios_podcasts: return "Apple Podcasts"
        case .availability_apple_ios_news: return "Apple News"
        case .availability_apple_ios_news_audio: return "Apple News Audio"
        case .availability_apple_ios_news_plus: return "Apple News+"
        
        case .availability_apple_watch_os_apple_music: return "Apple Watch: Apple Music"
        case .availability_apple_watch_os_apple_pay: return "Apple Watch: Apple Pay"
        case .availability_apple_watch_os_blood_oxygen_app: return "Apple Watch: Blood Oxygen App"
        case .availability_apple_watch_os_ecg: return "Apple Watch: ECG"
        case .availability_apple_watch_os_irregular_rhythm_notifications: return "Apple Watch: Irregular Rhythm Notifications"
        case .availability_apple_watch_os_radio: return "Apple Watch: Radio"
        case .availability_apple_watch_os_siri: return "Apple Watch: Siri"
        case .availability_apple_watch_os_student_id_cards: return "Apple Watch: Student ID Cards"
        case .availability_apple_watch_os_walkie_talkie: return "Apple Watch: Walkie Talkie"
        
        case .availabilities: return "Availabilities"
        case .availability_alexa: return "Alexa"
        case .availability_amc_plus: return "AMC+"
        case .availability_at_and_t_tv: return "AT&T TV"
        case .availability_dazn: return "DAZN"
        case .availability_discovery_plus: return "Discovery+"
        case .availability_disney_plus: return "Disney+"
        case .availability_espn_plus: return "ESPN+"
        case .availability_google_assistant: return "Google Assistant"
        case .availability_google_pay: return "Google Pay"
        case .availability_google_play_pass: return "Google Play Pass"
        case .availability_hbo_max: return "HBO Max"
        case .availability_hulu: return "Hulu"
        case .availability_nvidia_geforce_now: return "NVIDIA GeForce NOW"
        case .availability_paramount_plus: return "Paramount+"
        case .availability_peacock: return "Peacock"
        case .availability_playstation_now: return "PlayStation Now"
        case .availability_samsung_pay: return "Samsung Pay"
        case .availability_showtime: return "Showtime"
        case .availability_spotify: return "Spotify"
        case .availability_stadia: return "Stadia"
        case .availability_starz: return "Starz"
        case .availability_starzplay: return "Starzplay"
        case .availability_tidal: return "Tidal"
        case .availability_venmo: return "Venmo"
        case .availability_xbox_cloud_gaming: return "Xbox Cloud Gaming"
        case .availability_xbox_game_pass: return "Xbox Game Pass"
        case .availability_xbox_live: return "Xbox Live"
        case .availability_youtube_premium: return "YouTube Premium"
        case .availability_youtube_tv: return "YouTube TV"
        
        case .geography_volcanoes: return "Volcanoes"
     
        case .info_age_structure: return "Age Structure"
        case .info_blood_type_distribution: return "Blood Type Distribution"
        case .info_median_age: return "Median Age"
        case .info_minimum_annual_leave: return "Minimum Annual Leave"
        case .info_minimum_wage: return "Minimum Wage"
        
        case .legality_abortion: return "Abortion"
        case .legality_bitcoin: return "Bitcoin"
        case .legality_cannabis: return "Cannabis"
        case .legality_drinking_age: return "Drinking Age"
        case .legality_drug_ayahuasca: return "Drug: Ayahuasca"
        case .legality_drug_cocaine: return "Drug: Cocaine"
        case .legality_drug_ibogaine: return "Drug: Ibogaine"
        case .legality_drug_meth: return "Drug: Meth"
        case .legality_drug_psilocybin_mushrooms: return "Drug: Psychedelic Mushrooms"
        case .legality_drug_psychoactive_cactus: return "Drug: Psychedelic Cacti"
        case .legality_drug_salvia_divinorum: return "Drug: Salvia Divinorum"
        case .legality_guns: return "Firearms"
        case .legality_incest: return "Incest"
        case .legality_marital_rape: return "Marital Rape"
        case .legality_pornography: return "Adult Film"
        case .legality_prostitution: return "Prostitution"
        case .legality_smoking_age: return "Smoking"
        
        case .national_animals: return "National Animals"
        case .national_anthem: return "National Anthem"
        case .national_birds: return "National Birds"
        case .national_capital: return "National Capital"
        case .national_parks: return "National Parks"
        case .national_trees: return "National Trees"
        
        case .ranking_adult_hiv_prevalence: return "Adult HIV Prevalence"
        case .ranking_alcohol_consumption: return "Alcohol Consumption"
        case .ranking_cannabis_use: return "Cannabis Use"
        case .ranking_civilian_firearms: return "Civilian Firearms"
        case .ranking_climate_change_performance_index: return "Climate Change Performance"
        case .ranking_co2_emissions: return "CO2 Emissions"
        case .ranking_corruption_perception_index: return "Corruption Perception"
        case .ranking_democracy_index: return "Democracy"
        case .ranking_divorce_rate: return "Divorce Rate"
        case .ranking_economic_freedom_index: return "Economic Freedom"
        case .ranking_education_index: return "Education"
        case .ranking_electricity_consumption: return "Electricity Consumption"
        case .ranking_employment_rate: return "Employment Rate"
        case .ranking_exports: return "Exports"
        case .ranking_external_debt: return "External Debt"
        case .ranking_fragile_state_index: return "Fragile State"
        case .ranking_freedom_rankings: return "Freedom"
        case .ranking_global_peace_index: return "Global Peace"
        case .ranking_global_terrorism_index: return "Global Terrorism"
        case .ranking_health_care_cost: return "Health Care Cost"
        case .ranking_home_ownership_rate: return "Home Ownership Rate"
        case .ranking_homicide_rate: return "Homicide Rate"
        case .ranking_human_development_index: return "Human Development"
        case .ranking_imports: return "Imports"
        case .ranking_incarceration_rate: return "Incarceration Rate"
        case .ranking_infant_mortality_rate: return "Infant Mortality Rate"
        case .ranking_inflation_rate: return "Inflation Rate"
        case .ranking_internet_connection_speeds: return "Internet Connection Speeds"
        case .ranking_legatum_prosperity_index: return "Prosperity"
        case .ranking_life_expectancy: return "Life Expectancy"
        case .ranking_maternal_mortality_rate: return "Maternal Mortality Rate"
        case .ranking_military_expenditures: return "Military Expenditures"
        case .ranking_natural_disaster_risk: return "Natural Disaster Risk"
        case .ranking_number_of_billionaires: return "Number of Billionaires"
        case .ranking_number_of_millionaires: return "Number of Millionaires"
        case .ranking_obesity_rate: return "Obesity Rate"
        case .ranking_population: return "Population"
        case .ranking_press_freedom_index: return "Press Freedom"
        case .ranking_quality_of_life_index: return "Quality of Life"
        case .ranking_quality_of_nationality: return "Quality of Nationality"
        case .ranking_social_progress_index: return "Social Progress"
        case .ranking_suicide_rate: return "Suicide Rate"
        case .ranking_tariff_rate: return "Tariff Rate"
        case .ranking_unemployment_rate: return "Unemployment Rate"
        case .ranking_wealth_per_adult: return "Wealth per Adult"
        case .ranking_workforce: return "Workforce"
        case .ranking_workforce_productivity: return "Workforce Productivity"
        case .ranking_world_giving_index: return "Generosity"
        case .ranking_world_happiness_report: return "World Happiness"
        
        case .service_apple_ios_maps_flyover: return "Flyover"
        case .service_cia_values: return "CIA Values"
        case .service_sovereign_state_history: return "Sovereign State History"
        case .service_country_events: return "Country Events"
        case .service_travel_advisories: return "Travel Advisories"
        case .service_wikipedia: return "Wikipedia"
        case .service_wikipedia_featured_pictures: return "Wikipedia Featured Pictures"
        
        case .value_health_care_system: return "Health Care System"
        case .value_military_enlistment_age: return "Military Enlistment Age"
        case .value_minimum_driving_age: return "Minimum Driving Age"
        case .value_system_of_government: return "System of Government"
        case .value_traffic_side: return "Side of traffic"
        case .value_voting_age: return "Voting Age"
            
        case .neighbors: return "Neighbors"
        }
    }
}
