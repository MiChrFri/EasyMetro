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
        case .red: return ["Matrix Stand", "Keymakers Lane", "Oracle Lane", "Boxing Avenue", "Cypher Lane", "Smith Lane", "Morpheus Lane", "Trinity Lane", "Neo Lane"]
        case .green: return ["North Pole", "Sheldon Street", "Greenland", "City Centre", "Stadium House", "Green House", "Green Cross", "South Pole", "South Park"]
        case .blue: return ["East End", "Foot Stand", "Football Stadium", "City Centre", "Peter Park", "Maximus", "Rocky Street", "Boxers Street", "Boxing avenue", "West End"]
        case .yellow: return ["Green Cross", "Orange Street", "Silk Board", "Snake Park", "Morpheus Lane", "Little Street", "Cricket Grounds"]
        case .black: return ["East End", "Gotham Street", "Batman Street", "Jokers Street", "Hawkins Street", "Da Vinci Lane", "South Park", "Newton Bath Tub", "Einstein Lane", "Neo Lane"]
        }
    }
    
    static let allStations = Set(red.stations + green.stations + blue.stations + yellow.stations + black.stations).sorted { $0 < $1 }
}

class MarsCityMetro {
    private let lineNames = ["Red", "Green", "Blue", "Yellow", "Black"]
    let metroGraph = MetroGraph()
    
    init() {
        setupMetroMap()
    }
    
    func setupMetroMap() {
        setupStations(metroGraph: metroGraph)
        
        addEdgesForStations(metroGraph: metroGraph, line: .black)
        addEdgesForStations(metroGraph: metroGraph, line: .blue)
        addEdgesForStations(metroGraph: metroGraph, line: .green)
        addEdgesForStations(metroGraph: metroGraph, line: .red)
        addEdgesForStations(metroGraph: metroGraph, line: .yellow)
    }

    private func setupStations(metroGraph: MetroGraph) {
        MarsCityMetroLine.allStations.forEach {
            metroGraph.addStation(withName: $0)
        }
    }
    
    private func addEdgesForStations(metroGraph: MetroGraph, line: MarsCityMetroLine) {
        let stationNames = line.stations
        
        for index in 0..<stationNames.count - 1 {
            let stationNameA = stationNames[index]
            let stationNameB = stationNames[index + 1]
            
            guard let stationA = metroGraph.stations[stationNameA], let stationB = metroGraph.stations[stationNameB] else { return }
            metroGraph.addEdge(stationA, to: stationB, line: line)
        }
    }

}

