//
//  WeatherZone.swift
//
//
//  Created by Evan Anderson on 6/12/22.
//

import Foundation
import SwiftSovereignStates
#if canImport(GEOSwift)
import GEOSwift
#endif
#if canImport(MapKit)
import MapKit
#endif

public final class WeatherZone : Jsonable {
    #if canImport(GEOSwift)
    public static func == (lhs: WeatherZone, rhs: WeatherZone) -> Bool {
        return lhs.name.elementsEqual(rhs.name) && lhs.subdivision == rhs.subdivision && lhs.geometry == rhs.geometry
    }
    #else
    public static func == (lhs: WeatherZone, rhs: WeatherZone) -> Bool {
        return lhs.name.elementsEqual(rhs.name) && lhs.subdivision == rhs.subdivision
    }
    #endif
    
    public let name:String, subdivision:SovereignStateSubdivisionWrapper?
    #if canImport(GEOSwift)
    public let geometry:Geometry
    #endif
    
    public init(name: String, subdivision: (any SovereignStateSubdivision)?) {
        self.name = name
        self.subdivision = subdivision?.wrapped()
    }
    #if canImport(GEOSwift)
    public init(name: String, subdivision: (any SovereignStateSubdivision)?, geometry: Geometry) {
        self.name = name
        self.subdivision = subdivision?.wrapped()
        self.geometry = geometry
    }
    #endif
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(subdivision)
        #if canImport(GEOSwift)
        hasher.combine(geometry)
        #endif
    }
    
    #if canImport(GEOSwift)
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
    #if canImport(MapKit)
    public lazy var geometry_overlay : MKPolygon? = {
        let points:[CLLocationCoordinate2D] = getPoints(geometry)
        guard !points.isEmpty else { return nil }
        var polygon = MKPolygon(coordinates: points, count: points.count)
        polygon.title = subdivision?.name
        return polygon
    }()
    #endif
    #endif
}
