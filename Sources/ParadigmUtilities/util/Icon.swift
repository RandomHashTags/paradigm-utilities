//
//  Icon.swift
//
//
//  Created by Evan Anderson on 11/20/20.
//

import Foundation
#if canImport(UIKit)
import UIKit
#endif

public enum Icon : String, CaseIterable {
    
    case emoji_drink_coffee = "☕"
    
    case emoji_food_apple = "🍎"
    case emoji_food_avocado = "🥑"
    case emoji_food_banana = "🍌"
    case emoji_food_blueberries = "🫐"
    case emoji_food_broccoli = "🥦"
    case emoji_food_carrot = "🥕"
    case emoji_food_cherry = "🍒"
    case emoji_food_coconut = "🥥"
    case emoji_food_corn = "🌽"
    case emoji_food_cucumber = "🥒"
    case emoji_food_eggplant = "🍆"
    case emoji_food_garlic = "🧄"
    case emoji_food_grape = "🍇"
    case emoji_food_kiwi = "🥝"
    case emoji_food_lemon = "🍋"
    case emoji_food_lettuce = "🥬"
    case emoji_food_mango = "🥭"
    case emoji_food_mushroom = "🍄"
    case emoji_food_olive = "🫒"
    case emoji_food_onion = "🧅"
    case emoji_food_peach = "🍑"
    case emoji_food_peanuts = "🥜"
    case emoji_food_pear = "🍐"
    case emoji_food_pineapple = "🍍"
    case emoji_food_potato = "🥔"
    case emoji_food_strawberry = "🍓"
    case emoji_food_tomato = "🍅"
    case emoji_food_watermelon = "🍉"
    
    case emoji_sport_archery = "🏹"
    case emoji_sport_badminton = "🏸"
    case emoji_sport_baseball = "⚾"
    case emoji_sport_basketball = "🏀"
    case emoji_sport_bowling = "🎳"
    case emoji_sport_boxing = "🥊"
    case emoji_sport_canoeing = "🛶"
    case emoji_sport_car_racing = "🏎️"
    case emoji_sport_chess = "♟️"
    case emoji_sport_climbing = "🧗"
    case emoji_sport_cricket = "🏏"
    case emoji_sport_cycling = "🚴"
    case emoji_sport_darts = "🎯"
    case emoji_sport_field_hockey = "🏑"
    case emoji_sport_fishing = "🎣"
    case emoji_sport_fencing = "🤺"
    case emoji_sport_football = "🏈"
    case emoji_sport_golf = "⛳"
    case emoji_sport_gymnastics = "🤸"
    case emoji_sport_horse_racing = "🏇🏻"
    case emoji_sport_ice_hockey = "🏒"
    case emoji_sport_judo = "🥋J"
    case emoji_sport_karate = "🥋K"
    case emoji_sport_lacrosse = "🥍"
    case emoji_sport_motorcycle_racing = "🏍️"
    case emoji_sport_olymics = "🥇"
    case emoji_sport_orienteering = "🧭"
    case emoji_sport_pool = "🎱"
    case emoji_sport_rugby = "🏉"
    case emoji_sport_running = "👟"
    case emoji_sport_skating = "⛸️"
    case emoji_sport_skiing = "🎿"
    case emoji_sport_softball = "🥎"
    case emoji_sport_soccer = "⚽"
    case emoji_sport_surfing = "🏄"
    case emoji_sport_swimming = "🏊"
    case emoji_sport_table_tennis = "🏓"
    case emoji_sport_taekwondo = "🥋T"
    case emoji_sport_tennis = "🎾"
    case emoji_sport_volleyball = "🏐"
    case emoji_sport_water_polo = "🤽"
    case emoji_sport_weight_lifting = "🏋️"
    case emoji_sport_wrestling = "🤼"
    
    case emoji_ballot_box_with_ballot = "🗳️"
    case emoji_birthday_cake = "🎂"
    case emoji_bomb = "💣"
    case emoji_chains = "⛓️"
    case emoji_cyclone = "🌀"
    case emoji_factory = "🏭"
    case emoji_fire = "🔥"
    case emoji_graduation_cap = "🎓"
    case emoji_globe_americas = "🌎"
    case emoji_globe_europe = "🌍"
    case emoji_ice_cube = "🧊"
    case emoji_leaf_fluttering_in_wind = "🍃"
    case emoji_left_right_arrow = "↔️"
    case emoji_lungs = "🫁"
    case emoji_miltary_helmet = "🪖"
    case emoji_money_dollar_banknote = "💵"
    case emoji_pistol = "🔫"
    case emoji_salt_shaker = "🧂"
    case emoji_scroll = "📜"
    case emoji_volcano = "🌋"
    case emoji_warning = "⚠️"
    case emoji_water_wave = "🌊"
    case emoji_wood = "🪵"
    
    case system_multicolor_airplane_circle_fill = "airplane.circle.fill"
    case system_multicolor_alarm = "alarm"
    case system_multicolor_animal_ladybug_fill = "ladybug.fill"
    case system_multicolor_antenna_radiowaves_left_and_right_circle_fill = "antenna.radiowaves.left.and.right.circle.fill"
    case system_multicolor_bell_badge = "bell.badge"
    case system_multicolor_bell_badge_fill = "bell.badge.fill"
    case system_multicolor_bell_circle_fill = "bell.circle.fill"
    case system_multicolor_bolt = "bolt"
    case system_multicolor_bolt_circle_fill = "bolt.circle.fill"
    case system_multicolor_bolt_fill = "bolt.fill"
    case system_multicolor_bookmark_fill = "bookmark.fill"
    case system_multicolor_calendar_badge_clock = "calendar.badge.clock"
    case system_multicolor_calendar_circle_fill = "calendar.circle.fill"
    case system_multicolor_car_circle_fill = "car.circle.fill"
    case system_multicolor_car_fill = "car.fill"
    case system_multicolor_car_electric = "bolt.car"
    case system_multicolor_car_electric_fill = "bolt.car.fill"
    case system_multicolor_checkmark_circle_fill = "checkmark.circle.fill"
    case system_multicolor_circle_badge_fill = "circlebadge.fill"
    case system_multicolor_cross_circle_fill = "cross.circle.fill"
    case system_multicolor_envelope_circle_fill = "envelope.circle.fill"
    case system_multicolor_exclamation_mark_triangle_fill = "exclamationmark.triangle.fill"
    case system_multicolor_flag_fill = "flag.fill"
    case system_multicolor_flag_circle_fill = "flag.circle.fill"
    case system_multicolor_folder = "folder"
    case system_multicolor_folder_circle_fill = "folder.circle.fill"
    case system_multicolor_folder_fill = "folder.fill"
    case system_multicolor_gear = "gear"
    case system_multicolor_gift = "gift"
    case system_multicolor_gift_fill = "gift.fill"
    case system_multicolor_house = "house"
    case system_multicolor_house_circle_fill = "house.circle.fill"
    case system_multicolor_house_fill = "house.fill"
    case system_multicolor_info_circle_fill = "info.circle.fill"
    case system_multicolor_leaf_circle_fill = "leaf.circle.fill"
    case system_multicolor_location_circle_fill = "location.circle.fill"
    case system_multicolor_lock = "lock"
    case system_multicolor_lock_circle_fill = "lock.circle.fill"
    case system_multicolor_lock_fill = "lock.fill"
    case system_multicolor_moon_circle_fill = "moon.circle.fill"
    case system_multicolor_paint_palette = "paintpalette"
    case system_multicolor_paint_palette_fill = "paintpalette.fill"
    case system_multicolor_pin_circle_fill = "pin.circle.fill"
    case system_multicolor_plus_circle_fill = "plus.circle.fill"
    case system_multicolor_snowflake = "snowflake"
    case system_multicolor_star = "star"
    case system_multicolor_star_circle = "star.circle"
    case system_multicolor_star_fill = "star.fill"
    case system_multicolor_star_slash = "star.slash"
    case system_multicolor_star_slash_fill = "star.slash.fill"
    case system_multicolor_timer = "timer"
    case system_multicolor_trash_circle_fill = "trash.circle.fill"
    case system_multicolor_weather_cloud_bolt_rain_fill = "cloud.bolt.rain.fill"
    case system_multicolor_weather_hurricane = "hurricane"
    case system_multicolor_weather_thermometer_sun_fill = "thermometer.sun.fill"
    case system_multicolor_weather_thermometer_snowflake = "thermometer.snowflake"
    case system_multicolor_weather_tornado = "tornado"
    case system_multicolor_weather_tropical_storm = "tropicalstorm"
    case system_multicolor_weather_wind = "wind"
    case system_multicolor_xmark_circle_fill = "xmark.circle.fill"
    case system_multicolor_xmark_octagon_fill = "xmark.octagon.fill"
    case system_multicolor_xmark_square_fill = "xmark.square.fill"
    
    case system_hierarchical_airplane_arrival = "airplane.arrival"
    case system_hierarchical_airplane_departure = "airplane.departure"
    case system_hierarchical_bell_and_waveform_fill = "bell.and.waveform.fill"
    case system_hierarchical_bitcoin_sign_circle = "bitcoinsign.circle"
    case system_hierarchical_bitcoin_sign_circle_fill = "bitcoinsign.circle.fill"
    case system_hierarchical_building_2_fill = "building.2.fill"
    case system_hierarchical_checklist = "checklist"
    case system_hierarchical_clock = "clock"
    case system_hierarchical_eye = "eye"
    case system_hierarchical_eye_fill = "eye.fill"
    case system_hierarchical_eye_slash = "eye.slash"
    case system_hierarchical_eye_slash_fill = "eye.slash.fill"
    case system_hierarchical_game_controller = "gamecontroller"
    case system_hierarchical_infinity_circle_fill = "infinity.circle.fill"
    case system_hierarchical_list_bullet_rectangle_fill = "list.bullet.rectangle.fill"
    case system_hierarchical_list_number = "list.number"
    case system_hierarchical_pawprint = "pawprint"
    case system_hierarchical_pawprint_fill = "pawprint.fill"
    case system_hierarchical_pawprint_circle_fill = "pawprint.circle.fill"
    case system_hierarchical_photo_fill_on_rectangle_fill = "photo.fill.on.rectangle.fill"
    case system_hierarchical_safari = "safari"
    case system_hierarchical_safari_fill = "safari.fill"
    case system_hierarchical_speedometer = "speedometer"
    case system_hierarchical_tv_play_fill = "play.tv.fill"
    
    case system_animal_hare = "hare"
    case system_animal_hare_fill = "hare.fill"
    case system_animal_tortoise = "tortoise"
    case system_animal_tortoise_fill = "tortoise.fill"
    
    case system_camera_aperture = "camera.aperture"
    
    case system_commerce_bag = "bag"
    case system_commerce_bag_fill = "bag.fill"
    case system_commerce_cart = "cart"
    case system_commerce_cart_fill = "cart.fill"
    case system_commerce_credit_card = "creditcard"
    case system_commerce_credit_card_fill = "creditcard.fill"
    case system_commerce_credit_card_circle = "creditcard.circle"
    case system_commerce_credit_card_circle_fill = "creditcard.circle.fill"
    case system_commerce_dollar_sign_circle = "dollarsign.circle"
    case system_commerce_dollar_sign_circle_fill = "dollarsign.circle.fill"
    
    case system_device_apple_watch = "applewatch"
    case system_device_apple_watch_checkmark = "applewatch.watchface"
    case system_device_apple_watch_exclamation_mark = "exclamationmark.applewatch"
    case system_device_apple_watch_slash = "applewatch.slash"
    case system_device_apple_tv = "appletv"
    case system_device_apple_tv_fill = "appletv.fill"
    case system_device_ipad = "ipad.landscape"
    case system_device_iphone = "iphone"
    case system_device_imac = "desktopcomputer"
    case system_device_macbook = "laptopcomputer"
    
    case system_health_ecg = "waveform.path.ecg"
    case system_health_ecg_rectangle = "waveform.path.ecg.rectangle"
    case system_health_ecg_rectangle_fill = "waveform.path.ecg.rectangle.fill"
    case system_health_pills = "pills"
    case system_health_pills_fill = "pills.fill"
    
    case system_letter_s_circle = "s.circle"
    case system_letter_s_circle_fill = "s.circle.fill"
    case system_letter_s_square = "s.square"
    case system_letter_s_square_fill = "s.square.fill"
    
    case system_math_function = "function"
    case system_math_number = "number"
    case system_math_number_circle = "number.circle"
    case system_math_number_circle_fill = "number.circle.fill"
    
    case system_arrow_down_doc = "arrow.down.doc"
    case system_arrow_down_doc_fill = "arrow.down.doc.fill"
    case system_battery_100 = "battery.100"
    case system_battery_100_bolt = "battery.100.bolt"
    case system_battery_25 = "battery.25"
    case system_battery_0 = "battery.0"
    case system_bell = "bell"
    case system_bell_fill = "bell.fill"
    case system_bell_slash = "bell.slash"
    case system_bell_slash_fill = "bell.slash.fill"
    case system_binoculars = "binoculars"
    case system_binoculars_fill = "binoculars.fill"
    case system_book_closed = "book.closed"
    case system_book_closed_fill = "book.closed.fill"
    case system_bookmark = "bookmark"
    case system_bookmark_slash = "bookmark.slash"
    case system_bookmark_slash_fill = "bookmark.slash.fill"
    case system_books_vertical = "books.vertical"
    case system_books_vertical_fill = "books.vertical.fill"
    case system_building_columns = "building.columns"
    case system_building_columns_fill = "building.columns.fill"
    case system_car = "car"
    case system_chart_bar = "chart.bar"
    case system_chart_bar_fill = "chart.bar.fill"
    case system_chart_pie = "chart.pie"
    case system_chart_pie_fill = "chart.pie.fill"
    case system_checkmark = "checkmark"
    case system_checkmark_circle = "checkmark.circle"
    case system_chevron_down = "chevron.down"
    case system_chevron_backward = "chevron.backward"
    case system_chevron_forward = "chevron.forward"
    case system_circle = "circle"
    case system_clock_arrow_2_circlepath = "clock.arrow.2.circlepath"
    case system_crown = "crown"
    case system_crown_fill = "crown.fill"
    case system_document = "doc"
    case system_document_fill = "doc.fill"
    case system_document_on_document = "doc.on.doc"
    case system_document_on_document_fill = "doc.on.doc.fill"
    case system_ellipsis_circle = "ellipsis.circle"
    case system_exclamation_mark_arrow_circlepath = "exclamationmark.arrow.circlepath"
    case system_exclamation_mark_circle = "exclamationmark.circle"
    case system_exclamation_mark_circle_fill = "exclamationmark.circle.fill"
    case system_exclamation_mark_triangle = "exclamationmark.triangle"
    case system_eyeglasses = "eyeglasses"
    case system_flame = "flame"
    case system_flame_fill = "flame.fill"
    case system_gift_card = "giftcard"
    case system_gift_card_fill = "giftcard.fill"
    case system_globe = "globe"
    case system_globe_americas = "globe.americas"
    case system_globe_europe = "globe.europe.africa"
    case system_globe_asia_australia = "globe.asia.australia"
    case system_graduation_cap = "graduationcap"
    case system_graduation_cap_fill = "graduationcap.fill"
    case system_gyroscope = "gyroscope"
    case system_hand_raised = "hand.raised"
    case system_hand_raised_fill = "hand.raised.fill"
    case system_hand_raised_slash = "hand.raised.slash"
    case system_hand_raised_slash_fill = "hand.raised.slash.fill"
    case system_heart = "heart"
    case system_heart_fill = "heart.fill"
    case system_heart_slash = "heart.slash"
    case system_heart_slash_fill = "heart.slash.fill"
    case system_leaf = "leaf"
    case system_leaf_arrow_triangle_circlepath = "leaf.arrow.triangle.circlepath"
    case system_lightbulb = "lightbulb"
    case system_lightbulb_fill = "lightbulb.fill"
    case system_lightbulb_slash = "lightbulb.slash"
    case system_lightbulb_slash_fill = "lightbulb.slash.fill"
    case system_line_3_horizontal = "line.3.horizontal"
    case system_link = "link"
    case system_location = "location"
    case system_location_fill = "location.fill"
    case system_location_slash = "location.slash"
    case system_location_slash_fill = "location.slash.fill"
    case system_location_view_finder = "location.viewfinder"
    case system_location_view_finder_fill = "location.fill.viewfinder"
    case system_lungs = "lungs"
    case system_lungs_fill = "lungs.fill"
    case system_magnifying_glass = "magnifyingglass"
    case system_magnifying_glass_circle = "magnifyingglass.circle"
    case system_magnifying_glass_circle_fill = "magnifyingglass.circle.fill"
    case system_map = "map"
    case system_map_fill = "map.fill"
    case system_music_note = "music.note"
    case system_music_note_list = "music.note.list"
    case system_newspaper = "newspaper"
    case system_newspaper_fill = "newspaper.fill"
    case system_people_3 = "person.3"
    case system_people_3_fill = "person.3.fill"
    case system_person = "person"
    case system_person_fill = "person.fill"
    case system_person_circle = "person.circle"
    case system_person_circle_fill = "person.circle.fill"
    case system_photo_tv = "photo.tv"
    case system_question_mark = "questionmark"
    case system_question_mark_circle = "questionmark.circle"
    case system_question_mark_circle_fill = "questionmark.circle.fill"
    case system_question_mark_square = "questionmark.square"
    case system_question_mark_square_fill = "questionmark.square.fill"
    case system_server_rack = "server.rack"
    case system_scroll = "scroll"
    case system_scroll_fill = "scroll.fill"
    case system_share = "square.and.arrow.up"
    case system_share_fill = "square.and.arrow.up.fill"
    case system_sign_no = "nosign"
    case system_moon = "moon"
    case system_photo = "photo"
    case system_ruler = "ruler"
    case system_textbook_closed = "text.book.closed"
    case system_textbook_closed_fill = "text.book.closed.fill"
    case system_trash = "trash"
    case system_trash_fill = "trash.fill"
    case system_trash_slash = "trash.slash"
    case system_trash_slash_fill = "trash.slash.fill"
    case system_wifi_exclamationmark = "wifi.exclamationmark"
    case system_wifi_slash = "wifi.slash"
    
    public static func valueOf(_ enumerationKey: String?) -> Icon? {
        guard let enumerationKey:String = enumerationKey else { return nil }
        return Icon.allCases.first(where: { "\($0)".elementsEqual(enumerationKey) })
    }
    public static func valueOfEmoji(_ enumerationKey: String?) -> Icon? {
        return valueOf(enumerationKey != nil ? "emoji_" + enumerationKey! : nil)
    }
    
    #if canImport(UIKit)
    public static func convertToUIImage(unicode: String?) -> UIImage? {
        guard let nsString:String = unicode else { return nil }
        let font:UIFont = UIFont.systemFont(ofSize: 14)
        let stringAttributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font]
        let imageSize:CGSize = nsString.size(withAttributes: stringAttributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0)
        UIColor.clear.set()
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize))
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes)
        let image:UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image?.withRenderingMode(.alwaysOriginal)
    }
    public func getUIImage() -> UIImage? {
        if isEmoji() {
            return Icon.convertToUIImage(unicode: rawValue)
        } else if isSFSymbol() {
            return getMultiColorImage() ?? getHierarchicalImage() ?? getDefaultImage(withTintColor: true)
        } else {
            return getDefaultImage(withTintColor: true)
        }
    }
    public func getBoldUIImage() -> UIImage? {
        return getUIImage()?.applyingSymbolConfiguration(.init(weight: .bold))?.withTintColor(.darkGray)
    }
    
    private func getTintColor() -> UIColor {
        switch self {
        case .system_multicolor_cross_circle_fill:
            return UIColor.red
        case .system_multicolor_info_circle_fill,
                .system_checkmark,
                .system_checkmark_circle,
                .system_multicolor_checkmark_circle_fill:
            return UIColor.link
        case .system_multicolor_star,
                .system_multicolor_star_fill:
            return .yellow
        default:
            return UIColor.label
        }
    }
    private func getDefaultImage(withTintColor: Bool) -> UIImage? {
        var uiimage:UIImage? = (UIImage(named: rawValue) ?? UIImage(systemName: rawValue))?.withRenderingMode(.alwaysOriginal)
        if withTintColor {
            uiimage = uiimage?.withTintColor(getTintColor())
        }
        return uiimage
    }
    private func getMultiColorImage() -> UIImage? {
        guard isMultiColor() else { return nil }
        let uiimage:UIImage?
        if #available(iOS 15.0, *) {
            uiimage = UIImage(systemName: rawValue)
        } else {
            uiimage = UIImage(named: rawValue) ?? UIImage(systemName: rawValue)?.withTintColor(getTintColor())
        }
        return uiimage?.withRenderingMode(.alwaysOriginal)
    }
    private func getHierarchicalImage() -> UIImage? {
        guard isHierarchical() else { return nil }
        if #available(iOS 15.0, *) {
            let configuration:UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(hierarchicalColor: UIColor.label)
            return UIImage(systemName: rawValue)?.withConfiguration(configuration)
        } else {
            return getDefaultImage(withTintColor: false)
        }
    }
    #endif
    
    public func isEmoji() -> Bool {
        return "\(self)".starts(with: "emoji_")
    }
    public func isSFSymbol() -> Bool {
        return "\(self)".starts(with: "system_")
    }
    public func isMultiColor() -> Bool {
        return "\(self)".starts(with: "system_multicolor_")
    }
    public func isHierarchical() -> Bool {
        return "\(self)".starts(with: "system_hierarchical_")
    }
}
