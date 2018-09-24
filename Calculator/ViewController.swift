//
//  ViewController.swift
//  Calculator
//  Main view
//  Created by Jon DeWent on 9/17/18.
//  Copyright © 2018 Jon DeWent. All rights reserved.
//

import UIKit


class ViewController: UIViewController, SettingsViewControllerDelegate {
    
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var textFrom: DecimalMinusTextField!

    @IBOutlet weak var textTo: DecimalMinusTextField!
    
    var calc:Calculations = Calculations()
    
    var activeTextField = UITextField()
    var mode:String?
    
    
    @IBOutlet weak var fromUnits: UILabel!
    @IBOutlet weak var toUnits: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mode = "Distance"
        
        let detectTouch = UITapGestureRecognizer(target: self, action:
            #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(detectTouch)
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// Clears out text from textTo and sets active textfield
    @IBAction func fromField(_ sender: UITextField) {
        textTo.text = ""
        activeTextField = textFrom;
    }
    
    // Clears out text from textFrom and sets active textfield
    @IBAction func toField(_ sender: UITextField) {
        textFrom.text = ""
        activeTextField = textTo
    }
    
    // Hides keyboard
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    // Clears all text fields
    func clearFields(){
        textTo.text = ""
        textFrom.text = ""
    }
    
    // Calls clear fields when clear button pressed
    @IBAction func clearFields(_ sender: UIButton) {
        //dismissKeyboard()
        clearFields()
        
    }
    
    // Calls model function calculate when calculates
    @IBAction func calculate(_ sender: UIButton) {
        if activeTextField == textFrom{
            textTo.text = calc.calculate(from:calc.currentFrom,to:calc.currentTo,value:textFrom.text!)
        }
        else{
            textFrom.text = calc.calculate(from:calc.currentTo,to:calc.currentFrom,value:textTo.text!)
        }
    }
    
    // calls model mode change function when mode button hit
    @IBAction func modeChange(_ sender: Any) {
        switchMode()
        self.mode = calc.mode
    }
    
    func switchMode() {
        calc.switchMode()
        toLabel.text = calc.currentTo
        fromLabel.text = calc.currentFrom
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let dest = segue.destination as? SettingsViewController {
            dest.mode = self.mode
          dest.toUnits = self.toLabel.text
            dest.fromUnits = self.fromLabel.text
            dest.delegate = self
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
//            if segue.identifier == "settingsSegue" {
//
//            if let dest = segue.destination.childViewControllers[0] as? SettingsViewController {
//               // dest.mode = self.mode
////                dest.toLabel = self.toLabel
////                dest.fromLabel = self.fromLabel
//               // dest.delegate = self
//            }
//            }
//    }
    
    // Sets label text to current units
    func showSelection(fromUnit: String, toUnit: String) {
        
        calc.currentFrom = fromUnit
        self.fromLabel.text = calc.currentFrom
        
        calc.currentTo = toUnit
        self.toLabel.text = calc.currentTo
    }
    
    
    @IBAction func settingsPressed(_ sender: UIButton) {
        //print("Made it here!")
//        if let d = self.delegate{
//            d.passMode(mode: self.mode!)
//        }
    }
    
    
    
    
}

