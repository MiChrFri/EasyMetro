//
//  RouteInputViewController.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import UIKit

class RouteInputViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let metro = MarsCityMetro()
        
        metro.findIntersections()
        
        for line in metro.lines {
            
            if line.name == MarsCityMetroLine.yellow.name {
                
                for inters in (line.stations["Green Cross"]?.intersecting)! {
                    print("\(inters.name) at \((inters.index))")
                }
                
               
                
            }
            
            
//            print("\(line.name) line ")
//            
//            var currentNode = line.first
//            while currentNode != nil {
//                print("-> \(currentNode!.name)")
//                currentNode = currentNode!.next
//            }
            
//            dump(line.stations)
        }
        
        
//        metro.lines.
    }
    
}

