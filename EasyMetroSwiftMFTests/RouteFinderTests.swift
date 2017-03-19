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
    
    

    
    func testgetLinesOfStation() {
        let test1 = "Batman street"
        let test1Return = routeFinder.getLinesOfStation(test1, lines: metro.lines)
        
        for station in test1Return {
            XCTAssertEqual(station.name, "Black")
        }
        
        let test2 = "Boxing avenue"
        let test2Return = routeFinder.getLinesOfStation(test2, lines: metro.lines)
        
        XCTAssertEqual(test2Return[0].name, "Red")
        XCTAssertEqual(test2Return[1].name, "Blue")
    }
}
