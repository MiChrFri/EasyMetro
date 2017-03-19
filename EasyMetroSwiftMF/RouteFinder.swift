//
//  RouteFinder.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

struct RouteFinder {
    
    
    func getLinesOfStation(_ stationName: String, lines:[MetroLine]) -> [MetroLine] {
        var stationLines:[MetroLine] = []
        
        for line in lines {
            if line.stations[stationName] != nil {
                stationLines.append(line)
            }
        }
        return stationLines
    }
}
