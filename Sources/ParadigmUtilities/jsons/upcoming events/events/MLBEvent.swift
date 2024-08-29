//
//  MLBEvent.swift
//  
//
//  Created by Evan Anderson on 10/14/22.
//

public struct MLBEvent : Jsonable {
    public typealias JSONKeys = ValueKeys
    
    public var team_away:ClientMLBTeam, team_home:ClientMLBTeam
    
    public init(team_away: ClientMLBTeam, team_home: ClientMLBTeam) {
        self.team_away = team_away
        self.team_home = team_home
    }
    
    public func getKeyValue(key: JSONKeys) -> Any? {
        switch key {
        case .team_away: return team_away
        case .team_home: return team_home
        }
    }
    public mutating func setKeyValue<T>(key: JSONKeys, value: T) {
        switch key {
        case .team_away:
            team_away = value as! ClientMLBTeam
            break
        case .team_home:
            team_home = value as! ClientMLBTeam
            break
        }
    }
}

public extension MLBEvent {
    enum ValueKeys : String, UpcomingEventValueKeys {
        case team_away
        case team_home
        
        public var category : UpcomingEventValueCategory {
            return UpcomingEventValueCategory.mlb
        }
        public var value_type : UpcomingEventValueType {
            return UpcomingEventValueType.mlb_team
        }
    }
}