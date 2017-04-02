//
//  MetroGraphTests.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 01/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import XCTest
@testable import EasyMetroSwiftMF

class MetroGraphTests: XCTestCase {

    func testAddEdge() {
        let metroGraph = MetroGraph()
        let stationA = Station(withName: "BatmanAvn")
        let stationB = Station(withName: "CatwomanStreet")
        
        metroGraph.addEdge(stationA, to: stationB, line: .red)
        
        XCTAssertEqual(metroGraph.edges.count, 2)
    }
    
    func testAddStation() {
        let metroGraph = MetroGraph()
        metroGraph.addStation(withName: "BatmanAvn")
        
        XCTAssertEqual(metroGraph.stations.first?.value.name, "BatmanAvn")
    }

}
