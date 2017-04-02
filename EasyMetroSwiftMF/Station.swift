//
//  Station.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 01/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

public class Station {
    let name: String
    public var visited: Bool
    public var neighbors: [Edge]
    public var route: [Station] = []
    
    init(withName name: String) {
        self.name = name
        self.visited = false
        self.neighbors = []
    }
}

extension Station: Hashable {
    public var hashValue: Int {
        get {
            return "\(name)".hashValue
        }
    }
}

// MARK: Equatable
public func ==(lhs: Station, rhs: Station) -> Bool {
    return lhs.name == rhs.name
}
