//
//  StationNode.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

public class StationNode {
    var index: Int!
    let name: String!
    let line: String!

    var intersecting:[StationNode] = []
    
    init(withName name: String, line: String) {
        self.name = name
        self.line = line
    }
    
    var next: StationNode?
    var previous: StationNode?
}
