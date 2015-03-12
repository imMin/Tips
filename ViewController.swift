//
//  ViewController.swift
//  Tips
//
//  Created by Min Hu on 3/8/15.
//  Copyright (c) 2015 Min Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var HideView: UIView!
    @IBOutlet weak var personLabel: UILabel!
    @IBOutlet weak var personField: UITextField!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        HideView.alpha = 0
        inputLabel.frame.origin.y = 200
        billField.frame.origin.y = inputLabel.frame.origin.y + 7
        HideView.frame.origin.y = inputLabel.frame.origin.y + 60
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount = (billField.text as NSString).doubleValue

        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var twosplit = total/2
        var threesplit = total/3
        var foursplit = total/4
        
        UIView.animateWithDuration(1, animations: {
            self.HideView.alpha = 1
            self.inputLabel.frame.origin.y = 40
            self.billField.frame.origin.y = self.inputLabel.frame.origin.y + 7
            self.HideView.frame.origin.y = self.inputLabel.frame.origin.y + 60
            })
  
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f", twosplit)
        threeLabel.text = String(format: "$%.2f", threesplit)
        fourLabel.text = String(format: "$%.2f", foursplit)
        if (!billField.text.isEmpty && !personField.text.isEmpty){
            var personNum = (personField.text as NSString).doubleValue
            var personsplit = total/personNum
            personLabel.text = String(format: "$%.2f", personsplit)
        }
        else {
            personLabel.text = "$0"
        }
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}