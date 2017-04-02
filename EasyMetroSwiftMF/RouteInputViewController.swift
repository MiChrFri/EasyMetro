//
//  RouteInputViewController.swift
//  EasyMetroSwiftMF
//
//  Created by Michael Frick on 19/03/2017.
//  Copyright © 2017 frickm. All rights reserved.
//

import UIKit

enum direction {
    case next, previous, both
}

class RouteInputViewController: UIViewController {
    @IBOutlet weak var departurePicker: UIPickerView!
    @IBOutlet weak var destinationPicker: UIPickerView!
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!
    
    let allStations = Array(MarsCityMetroLine.allStations)
    var metro = MarsCityMetro()
    let routeFinder = RouteFinder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departurePicker.delegate = self
        destinationPicker.delegate = self
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let from = departureLabel.text, let to = destinationLabel.text else { return }
        
        if var fromStation = metro.metroGraph.stations[from], let toStation = metro.metroGraph.stations[to] {
            let shortestPath = routeFinder.breadthFirstSearch(metroGraph: metro.metroGraph, station: &fromStation, destination: toStation)
            
            let ticketFormatter = TicketFormatter()
            if let ticketData = ticketFormatter.getTicketData(stations: shortestPath) {
                print("\(ticketData.fromTo[0]) ⟶ \(ticketData.fromTo[1])")
                print("Costs: \(ticketData.ticketPrice)$ ")
                print("Duration: \(ticketData.travelTime) min ")
                print(ticketData.directions)
            }
        }
    }
}

extension RouteInputViewController: UIPickerViewDataSource {
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return allStations.count
    }
}

extension RouteInputViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return allStations[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == departurePicker {
            departureLabel.text = allStations[row]
        } else if pickerView == destinationPicker {
            destinationLabel.text = allStations[row]
        }

    }
}
