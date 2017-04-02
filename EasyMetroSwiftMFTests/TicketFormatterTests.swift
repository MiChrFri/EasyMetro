//
//  TicketFormatterTests.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 02/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import XCTest
@testable import EasyMetroSwiftMF

class TicketFormatterTests: XCTestCase {
    let metro = MarsCityMetro()
    let ticketFormatter = TicketFormatter()
    
    func testTicketFormatter() {
        let stationA = Station(withName: "Oracle Lane")
        let stationB = Station(withName: "Boxing Avenue")
        let stationC = Station(withName: "Cypher Lane")
        metro.metroGraph.addEdge(stationA, to: stationB, line: .red)
        metro.metroGraph.addEdge(stationB, to: stationC, line: .blue)
    
        let ticketData = ticketFormatter.getTicketData(stations: [stationA, stationB, stationC])
        
        XCTAssertEqual(ticketData?.fromTo[0], "Oracle Lane")
        XCTAssertEqual(ticketData?.fromTo[1], "Cypher Lane")        
        XCTAssertEqual(ticketData?.ticketPrice, 4)
        XCTAssertEqual(ticketData?.travelTime, 15)
        XCTAssertEqual(ticketData?.directions, "Take the Red Line at Oracle Lane towards Boxing Avenue\n⥅ Switch to the Blue Line at Boxing Avenue and get off at your destination - Cypher Lane")
    }
    
}
