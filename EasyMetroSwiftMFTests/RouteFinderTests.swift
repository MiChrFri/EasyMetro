//
//  RouteFinderTests.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import XCTest
@testable import EasyMetroSwiftMF

class RouteFinderTests: XCTestCase {
    let metro = MarsCityMetro()
    let routeFinder = RouteFinder()
    
    func testFindRoute() {
        if var fromStation = metro.metroGraph.stations["Peter Park"], let toStation = metro.metroGraph.stations["Foot Stand"] {
            let shortestPath = routeFinder.breadthFirstSearch(metroGraph: metro.metroGraph, station: &fromStation, destination: toStation)
            
            XCTAssertEqual(shortestPath[0].name, "Peter Park")
            XCTAssertEqual(shortestPath[1].name, "City Centre")
            XCTAssertEqual(shortestPath[2].name, "Football Stadium")
            XCTAssertEqual(shortestPath[3].name, "Foot Stand")
        }
        
        if var fromStation = metro.metroGraph.stations["South Park"], let toStation = metro.metroGraph.stations["Silk Board"] {
            let shortestPath = routeFinder.breadthFirstSearch(metroGraph: metro.metroGraph, station: &fromStation, destination: toStation)
            
            XCTAssertEqual(shortestPath[0].name, "South Park")
            XCTAssertEqual(shortestPath[1].name, "South Pole")
            XCTAssertEqual(shortestPath[2].name, "Green Cross")
            XCTAssertEqual(shortestPath[3].name, "Orange Street")
            XCTAssertEqual(shortestPath[4].name, "Silk Board")
        }
    }
    
}
