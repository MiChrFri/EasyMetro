//
//  MetroMapTests.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import XCTest
@testable import EasyMetroSwiftMF

class MetroMapTests: XCTestCase {
    let metro = MarsCityMetro()
    
    func testFindIntersections() {
        metro.findIntersections()
        
        for line in metro.lines {
            if line.name == MarsCityMetroLine.yellow.name {
                if let intersection = (line.stations["Green Cross"]?.intersecting)?.first {
                    XCTAssertEqual(intersection.index, 6)
                }
            }
            
            if line.name == MarsCityMetroLine.green.name {
                if let intersection = (line.stations["Green Cross"]?.intersecting)?.first {
                    XCTAssertEqual(intersection.index, 0)
                }
            }
            
            if line.name == MarsCityMetroLine.green.name {
                if let intersections = (line.stations["Greenland"]?.intersecting) {
                    XCTAssertEqual(intersections.count, 0)
                }
            }
        }
    }
    
}

