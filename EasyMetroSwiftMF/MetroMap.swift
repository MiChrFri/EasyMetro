//
//  MetroMap.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

class MetroMap {
    let lines:[MetroLine]!
    
    init(withLines lines:[MetroLine]) {
        self.lines = lines
    }
    

    
    public func findIntersections() {
        for line in lines {
            for key in line.stations.keys {
                for l in lines {
                    if l.name != line.name {
                        if let intersectingStation = l.stations[key] {
                            line.stations[key]?.intersecting.append(intersectingStation)
                        }
                    }
                }
            }
        }
    }
}

