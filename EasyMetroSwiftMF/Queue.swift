//
//  Queue.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 01/04/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

public struct Queue<T> {
    fileprivate var array = [T]()

    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return array.count > 0 ? array.removeFirst() : nil
    }
    
    public var front: T? {
        return array.first
    }
}
