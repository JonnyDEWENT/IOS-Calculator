//
//  SettingsViewController.swift
//  Calculator
//
//  Created by Jon DeWent on 9/20/18.
//  Copyright © 2018 Jon DeWent. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func showSelection(fromUnit:String, toUnit:String)
}

class SettingsViewController: UIViewController {
    //
    var pickerData:[String] = [String]()
    var delegate : SettingsViewControllerDelegate?
    var mode:String?
    
    
    var activeLabel = UILabel()
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    
    var fromUnits: String?
    var toUnits: String?
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        self.mode = Calculations.getMode()
        
        setDataSource(mode: self.mode!)
        //self.pickerData = ["dog"]
        self.picker.delegate = self
        self.picker.dataSource = self
        self.picker.reloadAllComponents()
        self.picker.isHidden = true
        
        
        toLabel.isUserInteractionEnabled = true
        toLabel.text = pickerData[1]
        fromLabel.isUserInteractionEnabled = true
        fromLabel.text = pickerData[0]
        
        
        let tapFrom = UITapGestureRecognizer(target: self, action: #selector(self.fromTapped))
        self.fromLabel.addGestureRecognizer(tapFrom)
        
        let tapTo = UITapGestureRecognizer(target: self, action: #selector(self.toTapped))
        self.toLabel.addGestureRecognizer(tapTo)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappedOut))
        self.view.addGestureRecognizer(tap)
        
    }
    
    func setDataSource(mode:String){
        if mode == "Distance"{
            self.pickerData = ["Yards","Meters","Miles"]
        }
        else {
            self.pickerData = ["Gallons","Liters","Quarts"]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func toTapped(_ sender: UITapGestureRecognizer) {
        activeLabel = toLabel
        self.picker.isHidden = false
        self.picker.reloadAllComponents()
        self.picker.isHidden = false
    }
    
    //@IBOutlet var fromTapped: UITapGestureRecognizer!
    
    @IBAction func fromTapped(_ sender: UITapGestureRecognizer) {
        activeLabel = fromLabel
        self.picker.isHidden = false
        self.picker.delegate = self
        self.picker.reloadAllComponents()
        self.picker.isHidden = false
    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        if let d = self.delegate{
            d.showSelection(fromUnit:self.fromLabel.text!, toUnit:self.toLabel.text!)
        }
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    @IBAction func tappedOut(_ sender: UITapGestureRecognizer) {
        self.picker.isHidden = true
    }
    
    func passMode(mode:String){
        self.mode = mode
    }
}
extension SettingsViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    func numberOfComponents(in: UIPickerView)-> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
        
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        
        activeLabel.text = self.pickerData[row]
    }
}
