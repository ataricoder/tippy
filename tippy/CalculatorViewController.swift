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
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        //Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        //Calcualte the tip and total
        let tip = bill * 0.1
        let total = bill + tip
        
        //Update the tip and total labels
        tipLabel.text = "$\(tip)"
        totalLabel.text="$\(total)"
    }
    
}
