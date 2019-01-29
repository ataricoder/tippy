//
//  CalculatorViewController.swift
//  tippy
//
//  Created by Dany Munoz on 1/28/19.
//  Copyright © 2019 danielmunoz. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add title to the navigation bar
        self.title = "Tippy"
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let numberPeople = Double(splitField.text!) ?? 0
        
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calcualte the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip)/numberPeople
        
        
        
        //Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func calculateSplit(_ sender: UISlider) {
        splitField.text! = String(Int(sender.value))
        
    }
}
