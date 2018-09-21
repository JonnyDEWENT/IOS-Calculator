//
//  Calculations.swift
//  Calculator
//
//  Created by Jon DeWent on 9/19/18.
//  Copyright © 2018 Jon DeWent. All rights reserved.
//

import Foundation
class Calculations{
    
    let yards = "Yards"
    let meters = "Meters"
    let miles = "Miles"
    
    let gallons = "Gallons"
    let liters = "Liters"
    let quarts = "Quarts"
    
    let distance = "Distance"
    let volume = "Volume"
    
    var currentTo:String
    var currentFrom:String
    
    var mode:String
    
    static var modeNum:Int = 0
    
    init () {
        
        currentTo = meters
        currentFrom = yards
        mode = distance
        
    }
    
    func switchMode(){
        if mode == distance{
            mode = volume
            Calculations.modeNum = 1
            currentTo = liters
            currentFrom = gallons
        }
        else {
            mode = distance
            Calculations.modeNum = 0
            currentTo = meters
            currentFrom = yards
        }
    }
    
    func calculate(from:String,to:String,value:String)->String{
        if mode == distance{
            return calcDistance(from:from,to:to,value:value)
        }
        else {
            return calcVolume(from:from,to:to,value:value)
        }
    }
    
    func calcDistance(from:String,to:String,value:String)->String{
        let fromValue = (value as NSString).floatValue
        var returnValue:Float = 0
        if from == yards{
            if to == meters{
                returnValue = fromValue * 0.9144
            }
            if to == miles {
                returnValue = fromValue * 0.000568182
            }
        }
        
        
        if from == meters {
            if to == yards {
                returnValue = fromValue / 0.9144
            }
            if to == miles {
                returnValue = fromValue * 0.000621371
            }
        }
        
        
        if from == miles {
            if to == yards {
                returnValue = fromValue / 0.000568182
            }
            
            if to == meters {
                returnValue = fromValue / 0.000621371
            }
            
        }
        
        return "\(returnValue)"
    }
    
    
    func calcVolume(from:String,to:String,value:String)->String{
        let fromValue = (value as NSString).floatValue
        var returnValue:Float = 0
        if from == gallons{
            if to == quarts{
                returnValue = fromValue * 4
            }
            if to == liters {
                returnValue = fromValue * 3.78541
            }
        }
        
        
        if from == liters {
            if to == gallons {
                returnValue = fromValue / 3.78541
            }
            if to == quarts {
                returnValue = fromValue / 0.946353
            }
        }
        
        
        if from == quarts {
            if to == gallons {
                returnValue = fromValue / 4
            }
            
            if to == liters {
                returnValue = fromValue * 0.946353
            }
            
        }
        
        return "\(returnValue)"
    }
    
    static func getMode() -> String {
        if self.modeNum == 0 {
            return "Distance"
        }
        else {
            return "Volume"
        }
    }
    
    
    
    
    
}
