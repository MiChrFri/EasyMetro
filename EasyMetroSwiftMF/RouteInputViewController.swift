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
        
        metro.findIntersections()
        
        departurePicker.delegate = self
        destinationPicker.delegate = self
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        routeFinder.findRoute(departure: departureLabel.text, destination: destinationLabel.text, metro: metro)
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
