//
//  RouteFinder.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

struct RouteFinder {
    
    func breadthFirstSearch(metroGraph : MetroGraph, station: inout Station, destination: Station) -> [Station] {
        var queue = Queue<Station>()
        queue.enqueue(station)
        
        var nodesExplored = [station.name]
        station.visited = true
        
        while let node = queue.dequeue() {
            for edge in node.neighbors {
                edge.to.route = node.route
                edge.to.route.append(node)
                
                let neighborNode = edge.to
                if !neighborNode.visited {
                    
                    queue.enqueue(neighborNode)
                    neighborNode.visited = true
                    nodesExplored.append(neighborNode.name)
                    
                    if neighborNode.name == destination.name {
                        neighborNode.route.append(destination)
                        return neighborNode.route
                    }
                }
            }
        }
        
        return []
    }

    
//    
//    func getLinesOfStation(_ stationName: String, lines:[MetroLine]) -> [MetroLine] {
//        var stationLines:[MetroLine] = []
//        
//        for line in lines {
//            if line.stations[stationName] != nil {
//                stationLines.append(line)
//            }
//        }
//        return stationLines
//    }
//    
//    func findRoute(departure: String?, destination: String?, metro: MarsCityMetro) -> String {
//        guard let departure = departure, let destination = destination else { return " error " }
//        
//        var departureLines:[MetroLine] = []
//        var output = ""
//        
//        let routeFinder = RouteFinder()
//        departureLines = routeFinder.getLinesOfStation(departure, lines: metro.lines)
//        for line in departureLines {
//            
//            if let startStation = line.stations[departure] {
//                startStation.index = 0
//                if let nodes = moveOn(station: startStation, searchDirection: .both, destination: destination, visitedNodes: [:]) {
//                    
//                    let sortedNodes = nodes.sorted{ $0.value.index < $1.value.index }
//                    for node in sortedNodes {
//                        output += " - " + node.key
//                        
//                        print("\(node.value.index) - \(node.key)")
//                    }
//                }
//            }
//        }
//        return output
//    }
//    
//    fileprivate func moveOn(station: StationNode?, searchDirection: direction, destination: String, visitedNodes:[String:StationNode]) -> [String:StationNode]? {
//        guard let station = station else { return nil }
//
//        var visited = visitedNodes
//        
//        if visited[station.name] == nil {
//            visited[station.name] = station
//        } else {
//            return nil
//        }
//        
//        if station.name == destination {
//            return visited
//        }
//        
//        switch searchDirection {
//        case .previous:
//            station.previous?.index = station.index + 1
//            if let result = moveOn(station: station.previous, searchDirection: .previous, destination: destination, visitedNodes :visited) {
//                return result
//            }
//        case .next:
//            station.next?.index = station.index + 1
//            if let result = moveOn(station: station.next, searchDirection: .next, destination: destination, visitedNodes :visited) {
//                return result
//            }
//        case .both:
//            var combinedResult:[String:StationNode] = [:]
//            
//            station.next?.index = station.index + 1
//            if let result1 = moveOn(station: station.next, searchDirection: .next, destination: destination, visitedNodes :visited) {
//                for (k,v) in result1 {
//                    combinedResult[k] = v
//                }
//            }
//            
//            station.previous?.index = station.index + 1
//            if let result2 = moveOn(station: station.previous, searchDirection: .previous, destination: destination, visitedNodes :visited) {
//                for (k,v) in result2 {
//                    combinedResult[k] = v
//                }
//            }
//            
//            return combinedResult.isEmpty ? nil : combinedResult
//        }
//        
//        if station.intersecting.count > 0  {
//            intersection(station: station, destination: destination, visitedNodes: visited)
//        }
//        
//        return nil
//    }
//    
//    fileprivate func intersection(station: StationNode, destination: String, visitedNodes: [String:StationNode]) -> [String:StationNode]?  {
//        for intersectingLine in station.intersecting {
//            intersectingLine.next?.index = station.index + 1
//            
//            var visited = visitedNodes
//            visited[station.name] = station
//            
//            var combinedResult:[String:StationNode] = [:]
//            
//            if let result1 = moveOn(station: intersectingLine.next, searchDirection: .next, destination: destination, visitedNodes :visited) {
//                for (k,v) in result1 {
//                    combinedResult[k] = v
//                }
//            }
//        
//            intersectingLine.previous?.index = station.index + 1
//            if let result2 = moveOn(station: intersectingLine.previous, searchDirection: .previous, destination: destination, visitedNodes :visited) {
//                for (k,v) in result2 {
//                    combinedResult[k] = v
//                }
//            }
//
//            return combinedResult.isEmpty ? nil : combinedResult
//        }
//        return nil
//    }
}

