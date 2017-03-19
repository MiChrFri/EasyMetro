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

    var intersecting:[StationNode] = []
    
    init(withName name: String, index: Int) {
        self.name = name
        self.index = index
    }
    
    var next: StationNode?
    var previous: StationNode?
}
