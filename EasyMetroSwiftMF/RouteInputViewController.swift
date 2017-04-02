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

    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var directionsTextView: UITextView!
    
    
    let allStations = Array(MarsCityMetroLine.allStations)
    var metro = MarsCityMetro()
    let routeFinder = RouteFinder()
    
    @IBOutlet weak var directionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        departurePicker.delegate = self
        destinationPicker.delegate = self
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let from = fromLabel.text, let to = toLabel.text else { return }
        
        if var fromStation = metro.metroGraph.stations[from], let toStation = metro.metroGraph.stations[to] {
        
            let shortestPath = routeFinder.breadthFirstSearch(metroGraph: metro.metroGraph, station: &fromStation, destination: toStation)
            
            print(shortestPath)
            
            let ticketFormatter = TicketFormatter()
            if let ticketData = ticketFormatter.getTicketData(stations: shortestPath) {
                durationLabel.text = "Duration: \(ticketData.travelTime) min"
                priceLabel.text = "Costs: \(ticketData.ticketPrice)$ "
                directionsTextView.text = ticketData.directions
            }
        }
        metro.metroGraph.stations.forEach({ $0.value.visited = false; $0.value.route = [] })
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
            fromLabel.text = allStations[row]
        } else if pickerView == destinationPicker {
            toLabel.text = allStations[row]
        }

    }
}
