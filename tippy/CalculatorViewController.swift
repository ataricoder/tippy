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
    @IBOutlet weak var splitControl: UISlider!
    @IBOutlet weak var splitField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add title to the navigation bar
        self.title = "Tippy"
    }
    
    
    //main function to calculate bill, called in actions
    func calculateBill() {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let split = Int(splitControl.value)
        let total = (bill + tip)/Double(split)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    //tap anywhere to dismiss keyboard
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    //update total, and the number of people for split
    @IBAction func calculateSplit(_ sender: UISlider) {
        splitField.text! = String(Int(sender.value))
        calculateBill()
    }
    
    //update total, if tip percentage change
    @IBAction func calculateTip(_ sender: Any) {
        calculateBill()
    }
    

}
