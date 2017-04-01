//
//  MetroGraph.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 01/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

struct Constants {
    static let distanceInMinutesForEdge = 5
}

class MetroGraph {
    var stations: [String:Station]!
    var edges: [Edge]!
    
    init() {
        self.stations = [:]
        self.edges = []
    }
    
    func addEdge(_ from: Station, to: Station, line: MarsCityMetroLine) {
        let edgeFromTo = Edge(from: from, to: to, line: line,  distanceInMinutes: Constants.distanceInMinutesForEdge)
        edges.append(edgeFromTo)
        from.neighbors.append(edgeFromTo)
        
        let edgeToFrom = Edge(from: to, to: from, line: line, distanceInMinutes: Constants.distanceInMinutesForEdge)
        edges.append(edgeToFrom)
        to.neighbors.append(edgeToFrom)
    }
    
    func addStation(withName name: String) {
        let station = Station(withName: name)
        stations[name] = station
    }
}
