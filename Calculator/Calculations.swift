//
//  Calculations.swift
//  Calculator
//  This class serves as a model for the ios calculator
//  Created by Jon DeWent on 9/19/18.
//  Copyright © 2018 Jon DeWent. All rights reserved.
//

import Foundation
class Calculations{
    
    
    // Declaring constant measurement units
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
    
    /**********************************************************
     * Constructor method
     ***********************************************************/
    init () {
        
        currentTo = meters
        currentFrom = yards
        mode = distance
        
    }
    
    /********************************************************
    * This function switches the current mode between distance and  volume
    ************************************************************/
 
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
    
    /**********************************************************
    * This is a helper function that plays middle man in translating
    * user calculation requests to the correct calculation function.
    ***********************************************************/
    func calculate(from:String,to:String,value:String)->String{
        if mode == distance{
            return calcDistance(from:from,to:to,value:value)
        }
        else {
            return calcVolume(from:from,to:to,value:value)
        }
    }
    
    
    /**********************************************************
     * This function runs a distance conversion calculation and
     * returns the results as a string.
     ***********************************************************/
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
            
            if to == yards {
                returnValue = fromValue
            }

        }
        
        
        if from == meters {
            if to == yards {
                returnValue = fromValue / 0.9144
            }
            if to == miles {
                returnValue = fromValue * 0.000621371
            }
            
            if to == meters {
                returnValue = fromValue
            }

        }
        
        
        if from == miles {
            if to == yards {
                returnValue = fromValue / 0.000568182
            }
            
            if to == meters {
                returnValue = fromValue / 0.000621371
            }
            
            if to == miles {
                returnValue = fromValue
            }

            
        }
        
        return "\(returnValue)"
    }
    
    /**********************************************************
    * This function runs a volume conversion calculation and
    * returns the results as a string.
    ***********************************************************/
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
            
            if to == gallons {
                returnValue = fromValue
            }

        }
        
        
        
        if from == liters {
            if to == gallons {
                returnValue = fromValue / 3.78541
            }
            if to == quarts {
                returnValue = fromValue / 0.946353
            }
            
            if to == liters {
                returnValue = fromValue
            }

        }
        
        
        if from == quarts {
            if to == gallons {
                returnValue = fromValue / 4
            }
            
            if to == liters {
                returnValue = fromValue * 0.946353
            }
            
            if to == quarts {
                returnValue = fromValue
            }

            
        }
        
        return "\(returnValue)"
    }
    
    
    /**********************************************************
    * This function returns the current mode of the calculator
    ***********************************************************/
//    static func getMode() -> String {
//        if self.modeNum == 0 {
//            return "Distance"
//        }
//        else {
//            return "Volume"
//        }
//    }
    
    
    
    
    
}
