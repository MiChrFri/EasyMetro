//
//  StationNode.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

public class StationNode {
    
    let name: String!
    
    init(withName name: String) {
        self.name = name
    }
    
    var next: StationNode?
    var previous: StationNode?
}
