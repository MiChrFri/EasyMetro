//
//  MarsCityMetro.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

enum MarsCityMetroLine: String {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
    case yellow = "Yellow"
    case black = "Black"
    
    var name: String {
        return self.rawValue
    }
    
    static let names = [red.name, green.name, blue.name, yellow.name, black.name]
    
    var stations: [String] {
        switch self {
        case .red: return ["Matrix Stand", "Keymakers Lane", "Oracle Lane", "Boxing avenue", "Cypher lane", "Smith lane", "Morpheus Lane", "Trinity lane", "Neo Lane"]
        case .green: return ["North Pole", "Sheldon Street", "Greenland", "City Centre", "Stadium House", "Green House", "Green Cross", "South Pole", "South Park"]
        case .blue: return ["East end", "Foot stand", "Football stadium", "City Centre", "Peter Park", "Maximus", "Rocky Street", "Boxers Street", "Boxing avenue", "West End"]
        case .yellow: return ["Green Cross", "Orange Street", "Silk Board", "Snake Park", "Morpheus lane", "Little Street", "Cricket Grounds"]
        case .black: return ["East end", "Gotham street", "Batman street", "Jokers street", "Hawkins street", "Da Vinci lane", "South Park", "Newton bath tub", "Einstein lane", "Neo lane"]
        }
    }
}

class MarsCityMetro: MetroMap {
    private let lineNames = ["Red", "Green", "Blue", "Yellow", "Black"]
    private var metroLines:[MetroLine] = []
    
    init() {
        for lineName in MarsCityMetroLine.names {
            self.metroLines.append(MetroLine(withName: lineName))
        }
        
        super.init(withLines: metroLines)
        setupStations()
    }
    
    fileprivate func setupStations() {
        var stations:[String] = []
        
        for metroLine in metroLines {
            if let lineName = metroLine.name {
                switch lineName {
                case MarsCityMetroLine.red.name: stations = MarsCityMetroLine.red.stations
                case MarsCityMetroLine.green.name: stations = MarsCityMetroLine.green.stations
                case MarsCityMetroLine.blue.name: stations = MarsCityMetroLine.blue.stations
                case MarsCityMetroLine.yellow.name: stations = MarsCityMetroLine.yellow.stations
                case MarsCityMetroLine.black.name: stations = MarsCityMetroLine.black.stations
                default: break
                }
                
                for (index, station) in stations.enumerated() {
                    metroLine.appendStation(withName: station, index: index)
                }
            }
        }
    }
    
}
