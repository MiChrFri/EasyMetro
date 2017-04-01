//
//  UndirectedGraph.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 01/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

class UndirectedGraph<T> {
    var vertices: [Vertex<T>]!
    var edges: [Edge<T>]!
    
    init() {
        self.vertices = []
        self.edges = []
    }
    
    func addEdge(_ from: Vertex<T>, to: Vertex<T>, withWeight weight: Float? = nil) {
        let edge = Edge(from: from, to: to, weight: weight)
        edges.append(edge)
    }
}
