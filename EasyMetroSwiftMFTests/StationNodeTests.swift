//
//  StationNodeTests.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import XCTest
@testable import EasyMetroSwiftMF

class StationNodeTests: XCTestCase {
    
    func testStationNodeCreation() {
        let firstStation = StationNode(withName: "First", index: 42)
        
        XCTAssertNotNil(firstStation.name)
        XCTAssertNotEqual(firstStation.name, "")
        XCTAssertEqual(firstStation.name, "First")
        XCTAssertEqual(firstStation.index, 42)
    }
}

