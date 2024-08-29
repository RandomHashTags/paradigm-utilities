//
//  SovereignStateAvailabilityCategory.swift
//
//
//  Created by Evan Anderson on 6/25/22.
//

public enum SovereignStateAvailabilityCategory : String, CaseIterable, Jsonable {    
    case communication_service
    case digital_payment_method
    case digital_storage_service
    case digital_store_service
    case entertainment_service
    case financial_service
    case gaming_service
    case health_service
    case music_service
    case news_service
    case physical_payment_method
    case vehicle_service
    case virtual_assistant
    
    public var name : String {
        switch self {
        case .communication_service: return "Communication Service"
        case .digital_payment_method: return "Digital Payment Method"
        case .digital_storage_service: return "Digital Storage Service"
        case .digital_store_service: return "Digital Store Service"
        case .entertainment_service: return "Entertainment Service"
        case .financial_service: return "Financial Service"
        case .gaming_service: return "Gaming Service"
        case .health_service: return "Health Service"
        case .music_service: return "Music Service"
        case .news_service: return "News Service"
        case .physical_payment_method: return "Physical Payment Method"
        case .vehicle_service: return "Vehicle Service"
        case .virtual_assistant: return "Virtual Assistant"
        }
    }
}
