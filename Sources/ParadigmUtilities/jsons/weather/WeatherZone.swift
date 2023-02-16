//
//  WeatherZone.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation
import SwiftSovereignStates
import GEOSwift
#if canImport(MapKit)
import MapKit
#endif

public final class WeatherZone : Jsonable {
    public static func == (lhs: WeatherZone, rhs: WeatherZone) -> Bool {
        return lhs.name.elementsEqual(rhs.name) && lhs.name_suffix == rhs.name_suffix && lhs.subdivision == rhs.subdivision && lhs.geometry == rhs.geometry
    }
    
    public let name:String, name_suffix:String?, subdivision:SovereignStateSubdivisionWrapper?, geometry:Geometry
    
    public init(name: String, name_suffix: String?, subdivision: (any SovereignStateSubdivision)?, geometry: Geometry) {
        self.name = name
        self.name_suffix = name_suffix
        self.subdivision = subdivision?.wrapped()
        self.geometry = geometry
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(name_suffix)
        hasher.combine(subdivision)
        hasher.combine(geometry)
    }
    
    #if canImport(MapKit)
    public lazy var geometryOverlay:MKPolygon? = {
        let points:[CLLocationCoordinate2D] = getPoints(geometry)
        guard !points.isEmpty else { return nil }
        var polygon = MKPolygon(coordinates: points, count: points.count)
        polygon.title = subdivision?.short_name
        return polygon
    }()
    private func getPoints(_ geometry: Geometry) -> [CLLocationCoordinate2D] {
        switch geometry {
        case .point(let point):
            return [CLLocationCoordinate2D(latitude: point.y, longitude: point.x)]
        case .lineString(let line):
            return line.points.map({ CLLocationCoordinate2D(latitude: $0.y, longitude: $0.x) })
        case .geometryCollection(let collection):
            return collection.geometries.map({ getPoints($0) }).flatMap({ $0 })
        case .multiLineString(let lines):
            return lines.lineStrings.map({ $0.points.map({ CLLocationCoordinate2D(latitude: $0.y, longitude: $0.x) }) }).flatMap({ $0 })
        case .multiPolygon(let polygons):
            return polygons.polygons.map({ $0.exterior.points.map({ CLLocationCoordinate2D(latitude: $0.y, longitude: $0.x) }) }).flatMap({ $0 })
        case .polygon(let polygon):
            return polygon.exterior.points.map({ CLLocationCoordinate2D(latitude: $0.y, longitude: $0.x) })
        case .multiPoint(let points):
            return points.points.map({ CLLocationCoordinate2D(latitude: $0.y, longitude: $0.x) })
        }
    }
    #endif
}
