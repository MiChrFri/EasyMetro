//
//  MetroLineTests.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import XCTest
@testable import EasyMetroSwiftMF

class MetroLineTests: XCTestCase {
    var testLine:MetroLine? = nil
    let testName = "Red"
    
    override func setUp() {
        super.setUp()

        testLine = MetroLine(withName: testName)
        XCTAssertNotNil(testLine)
        
        if let testLine = testLine {
            XCTAssertTrue(testLine.isEmpty)
            XCTAssertNotEqual(testLine.name, "")
            XCTAssertEqual(testLine.name, testName)
        }
    }
    
    func testAppendStation() {
        if let testLine = testLine {
            // setup
            let testStationNames = ["station1", "station2", "station3"]
            
            for name in testStationNames {
                testLine.appendStation(withName: name, index: 0)
            }

            XCTAssertFalse(testLine.isEmpty)
            
            // test for correct content
            var stationNames:[String] = []
    
            var currentNode = testLine.first
            while currentNode != nil {
                stationNames.append(currentNode!.name)
                currentNode = currentNode!.next
            }
            
            XCTAssertEqual(stationNames, testStationNames)
            XCTAssertEqual(testLine.first?.name, testStationNames.first)
            XCTAssertEqual(testLine.last?.name, testStationNames.last)
        }
    }
}
