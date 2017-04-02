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
    
}

