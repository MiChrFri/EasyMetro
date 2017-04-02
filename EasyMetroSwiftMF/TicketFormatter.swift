//
//  TicketFormatter.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 02/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

struct TicketFormatter {
    
    func getTicketData(stations: [Station]) -> metroTicketData? {
        var lineChanges = 0
        var lastLine: MarsCityMetroLine?
        var route: [RouteStation] = []

        for (i, node) in stations.enumerated() {
            if i < stations.count - 1 {
                guard let edge = node.neighbors.filter({ $0.to == stations[i + 1] }).first else { return nil }
                var routeStation = RouteStation(name: node.name, currentLine: edge.line)
                
                if lastLine != nil {
                    if edge.line.name != lastLine?.name {
                        lineChanges += 1
                        routeStation.addLineSwitchFrom(line: lastLine)
                    }
                }
                lastLine = edge.line
                route.append(routeStation)
            } else if i == stations.count - 1, let line = lastLine {
                let destinationStation = RouteStation(name: node.name, currentLine: line)
                route.append(destinationStation)
            }
        }
        
        guard let fromTo = getFromTo(route: route) else { return nil }
        let travelTime = getTravelTime(route: route)
        let ticketPrice = getTicketPrice(route: route, numberOfchanges: lineChanges)
        let directions = getDirections(route: route)
        
        let ticketData = metroTicketData(fromTo: fromTo, travelTime: travelTime, ticketPrice: ticketPrice, directions: directions)
        return ticketData
    }
    
    private func getFromTo(route: [RouteStation]) ->[String]? {
        guard let from = route.first?.name, let to = route.last?.name else { return nil }
        return [from, to]
    }
    
    private func getTravelTime(route: [RouteStation]) ->Int {
        return route.count * MarsCityMetroLine.timePerStation
    }
    
    private func getTicketPrice(route: [RouteStation], numberOfchanges: Int) ->Int {
        return (route.count +  numberOfchanges) * MarsCityMetroLine.pricePerStation
    }
    
    private func getDirections(route: [RouteStation]) -> String {
        let errorText = "Sorry! something went wrong"
        
        if route.count > 2 {
            guard let start = route.first else { return errorText }
            var directions = "Take the \(start.currentLine.name) Line at \(start.name) "
            
            for station in 1..<route.count {
                if route[station].switchedFrom != nil {
                    directions += "towards \(route[station].name)\n"
                    directions += "⥅ Switch to the \(route[station].currentLine.name) Line at \(route[station].name) "
                }
            }
            
            guard let destination = route.last else { return errorText }
            directions += "and get off at your destination - \(destination.name)"
            
            return directions
        }
        return errorText
    }

}

struct RouteStation {
    let name: String
    let currentLine: MarsCityMetroLine
    var switchedFrom: MarsCityMetroLine?
    
    init(name: String, currentLine: MarsCityMetroLine) {
        self.name = name
        self.currentLine = currentLine
        self.switchedFrom = nil
    }
    
    mutating func addLineSwitchFrom(line: MarsCityMetroLine?) {
        switchedFrom = line
    }
}

struct metroTicketData {
    let fromTo: [String]
    let travelTime: Int
    let ticketPrice: Int
    let directions: String
}
