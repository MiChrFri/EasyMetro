//
//  Edge.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 01/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

public struct Edge<T> {
    let from: Vertex<T>
    let to: Vertex<T>
    
    public let weight: Float?
}
