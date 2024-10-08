//
//  RemoteNotificationSubcategoryApple.swift
//
//
//  Created by Evan Anderson on 6/18/22.
//

public enum RemoteNotificationSubcategoryApple : String, CaseIterable, RemoteNotificationSubcategory {
    case ios_update
    case ipados_update
    case macos_update
    case macos_security_update
    case watchos_update
    case tvos_update
    case safari_update
    case xcode_update
    
    public var category : RemoteNotificationCategory {
        return RemoteNotificationCategory.apple
    }
    
    private func getType() -> String {
        switch self {
        case .ios_update: return "iOS"
        case .ipados_update: return "iPadOS"
        case .macos_update: return "macOS"
        case .macos_security_update: return "macOS Security"
        case .watchos_update: return "watchOS"
        case .tvos_update: return "tvOS"
        case .safari_update: return "Safari"
        case .xcode_update: return "Xcode"
        }
    }
    
    public var name : String {
        let suffix:String = " Update"
        return getType() + suffix
    }
    
    public var is_conditional : Bool {
        return false
    }
}
