//
//  MetroLine.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//


public class MetroLine {
    fileprivate var firstStation: StationNode?  // head
    private var lastStation: StationNode?       // tail
    
    //MARK: - Public Properties
    public let name:String?
    
    public var isEmpty: Bool {
        return firstStation == nil
    }
    
    public var first: StationNode? {
        return firstStation
    }
    
    public var last: StationNode? {
        return lastStation
    }
    
    
    //MARK: - Initilaizer
    init(withName name:String) {
        self.name = name
    }
    
    
    //MARK: - Public Functions
    public func appendStation(withName name:String) {
        let station = StationNode(withName: name)
        
        if let lastNode = lastStation {
            station.previous = lastNode
            lastNode.next = station
        } else {
            firstStation = station
        }
        
        lastStation = station
    }
}
