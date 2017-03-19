//
//  RouteInputViewController.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import UIKit

enum direction {
    case next, previous, both
}

class RouteInputViewController: UIViewController {

    var metro = MarsCityMetro()
    let routeFinder = RouteFinder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        metro.findIntersections()

        findRoute()
    }
    

    func findRoute() {
        let departure = "Batman street"
        let destination = "Trinity lane"
        var departureLines:[MetroLine] = []
        
        let routeFinder = RouteFinder()
        departureLines = routeFinder.getLinesOfStation(departure, lines: metro.lines)
        for line in departureLines {

            if let startStation = line.stations[departure] {
                startStation.index = 0
                if let nodes = moveOn(station: startStation, searchDirection: .both, destination: destination, visitedNodes: [:]) {
                    
                   // let sorted = nodes.sorted { $0.value.index < $1.value.index }
                    
                    let fruitsTupleArray = nodes.sorted{ $0.value.index < $1.value.index }
                    
                    //print(fruitsTupleArray)
                    for node in fruitsTupleArray {
                        print("\(node.value.index) - \(node.key)")
                    }
                }
            }
        }
        
    }
    
    
    
    func moveOn(station: StationNode?, searchDirection: direction, destination: String, visitedNodes:[String:StationNode]) -> [String:StationNode]? {
        guard let station = station else { return nil }
        var visited = visitedNodes
        
        if visited[station.name] == nil {
            visited[station.name] = station
        } else {
            return nil
        }
        
        // if found
        if station.name == destination {
            return visited
        }
        
        switch searchDirection {
        case .previous:
            station.previous?.index = station.index + 1
            if let result = moveOn(station: station.previous, searchDirection: .previous, destination: destination, visitedNodes :visited) {
                return result
            }
        case .next:
            station.next?.index = station.index + 1
            if let result = moveOn(station: station.next, searchDirection: .next, destination: destination, visitedNodes :visited) {
                return result
            }
        case .both:
            var combinedResult:[String:StationNode] = [:]
            
            station.next?.index = station.index + 1
            if let result1 = moveOn(station: station.next, searchDirection: .next, destination: destination, visitedNodes :visited) {
                for (k,v) in result1 {
                    combinedResult[k] = v
                }
            }
            
            station.previous?.index = station.index + 1
            if let result2 = moveOn(station: station.previous, searchDirection: .previous, destination: destination, visitedNodes :visited) {
                for (k,v) in result2 {
                    combinedResult[k] = v
                }
            }
            
            return combinedResult.isEmpty ? nil : combinedResult
        }
        
        if station.intersecting.count > 0  {
            for intersectingLine in station.intersecting {
                intersectingLine.next?.index = station.index + 1
                
                var combinedResult:[String:StationNode] = [:]
                
                if let result1 = moveOn(station: intersectingLine.next, searchDirection: .next, destination: destination, visitedNodes :visited) {
                    for (k,v) in result1 {
                        combinedResult[k] = v
                    }
                }
                
                intersectingLine.previous?.index = station.index + 1
                if let result2 = moveOn(station: intersectingLine.previous, searchDirection: .previous, destination: destination, visitedNodes :visited) {
                    for (k,v) in result2 {
                        combinedResult[k] = v
                    }
                }
                
                return combinedResult.isEmpty ? nil : combinedResult
            }
        }
        
        return nil
    }
    
}

