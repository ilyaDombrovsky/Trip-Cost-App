//
//  ViewController.swift
//  Trop Cost App
//
//  Created by Ilya Dombrovsky on 30.06.22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var consuptionFuelLabel: UILabel!
    @IBOutlet weak var mileageTripLabel: UILabel!
    @IBOutlet weak var costFuelLabel: UILabel!
    @IBOutlet weak var tripCostLabel: UILabel!
    @IBOutlet weak var kmOrMileSwitchLabel: UISwitch!
    @IBOutlet weak var kmLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel! {
        didSet {
            orLabel.text = "/"
            orLabel.textColor = .gray
        }
    }
    @IBOutlet weak var mileLabel: UILabel! {
        didSet {
            mileLabel.text = "mile"
            mileLabel.textColor = .gray
        }
    }
    @IBOutlet weak var mileageTripTF: UITextField!
    @IBOutlet weak var costFuelTF: UITextField!
    @IBOutlet weak var consuptionFuelSliderOutlet: UISlider! {
        didSet {
            consuptionFuelSliderOutlet.maximumValue = 20
            consuptionFuelSliderOutlet.minimumValue = 0
            consuptionFuelSliderOutlet.value = 0
        }
    }
    func calculate() {
        let consuptionFuel = Double(consuptionFuelSliderOutlet.value)
        let stringFuel = String(format: "%.1f", consuptionFuel)
        
        consuptionFuelLabel.text! = "Расход топлива - \(stringFuel) литров"
        
        guard let consuptionFuelValueForTripCost = Double(String(format: "%.1f", consuptionFuel)) else { return }
        guard let costFuel = Double(costFuelTF.text!) else {
            return tripCostLabel.text = "Введите стоимость топлива" }
        guard var mileageTrip = Double(mileageTripTF.text!) else {
            return tripCostLabel.text = "Введите пробег поездки" }
        
        
        mileageTrip /= 100
        
        let tripCost = (costFuel * consuptionFuelValueForTripCost * mileageTrip)
        let tripCostString = String(format: "%.2f", tripCost)
        let coef = kmOrMileSwitchLabel.isOn ? 1.61:1
        let multy = tripCost * Double(coef)
        let multyString = String(format: "%.2f", multy)
        
        
        if kmOrMileSwitchLabel.isOn {
            tripCostLabel.text! = "Стоимость поездки равна - \(multyString) рубля"
        } else {
            tripCostLabel.text! = "Стоимость поездки равна - \(tripCostString) рубля"
            
            tripCostLabel.adjustsFontSizeToFitWidth = true
            tripCostLabel.minimumScaleFactor = 0.5
        }
        if mileageTripLabel.text != nil && costFuelLabel.text != nil && consuptionFuelSliderOutlet.value < 0.1 {
            tripCostLabel.text = "Укажите расход топлива"
        }
    }
    
    @IBAction func kmOrMileSwitch(_ sender: UISwitch) {
        if sender.isOn {
            kmLabel.textColor = .gray
            orLabel.textColor = .gray
            mileLabel.textColor = .white
        } else {
            kmLabel.textColor = .white
            orLabel.textColor = .gray
            mileLabel.textColor = .gray
        }
        calculate()
    }
    
    @IBAction func calculatemileageTripTFAction(_ sender: UITextField) {
        calculate()
    }
    
    @IBAction func costFuelTFAction(_ sender: UITextField) {
        calculate()
    }
    
    @IBAction func consuptionFuelSlider(_ sender: UISlider) {
        calculate()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}






