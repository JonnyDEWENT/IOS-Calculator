//
//  ViewController.swift
//  Calculator
//
//  Created by Jon DeWent on 9/17/18.
//  Copyright © 2018 Jon DeWent. All rights reserved.
//

import UIKit

//protocol passModeDelegate{
//    func passMode(mode:String)
//}

class ViewController: UIViewController, SettingsViewControllerDelegate {
    
//    var delegate : passModeDelegate?
    
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


    @IBAction func fromField(_ sender: UITextField) {
        textTo.text = ""
        activeTextField = textFrom;
    }
    
    @IBAction func toField(_ sender: UITextField) {
        textFrom.text = ""
        activeTextField = textTo
    }
    
    @objc func dismissKeyboard(){
        self.view.endEditing(true)
    }
    
    
    func clearFields(){
        textTo.text = ""
        textFrom.text = ""
    }
    
    @IBAction func clearFields(_ sender: UIButton) {
        //dismissKeyboard()
        clearFields()
        
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        if activeTextField == textFrom{
            textTo.text = calc.calculate(from:calc.currentFrom,to:calc.currentTo,value:textFrom.text!)
        }
        else{
            textFrom.text = calc.calculate(from:calc.currentTo,to:calc.currentFrom,value:textTo.text!)
        }
    }
    
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
            dest.delegate = self
        }
    }
    
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

