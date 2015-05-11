//
//  ViewController.swift
//  Ad Libs
//
//  Created by Denzel Carter on 5/9/15.
//  Copyright (c) 2015 BearBrosDevelopment. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textFields: [UITextField]!
    
    @IBOutlet var pastTenseVerbTextField: UITextField!
    @IBOutlet var sigularNounTextField: UITextField!
    @IBOutlet var pluralNounTextField: UITextField!
    @IBOutlet var phraseTextField: UITextField!
    @IBOutlet var placeSegmentControl: UISegmentedControl!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var resultsTextView: UITextView!
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderLabel.text = "0"
        
        textFields = [pastTenseVerbTextField, sigularNounTextField, pluralNounTextField, phraseTextField]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        var placeString = ""
        if placeSegmentControl.selectedSegmentIndex == 0 {
            placeString = "barber"
        } else if placeSegmentControl.selectedSegmentIndex == 1 {
            placeString = "mail"
        } else {
            placeString = "library"
        }
        
        resultsTextView.text = "One day at the \(placeString) \(sigularNounTextField.text) \(pastTenseVerbTextField.text) \(sliderLabel.text) \(pluralNounTextField.text) and said , \(phraseTextField.text) "
    }
    
    
    @IBAction func sliderValueChanged(sender: AnyObject) {
        sliderLabel.text = "\(Int(slider.value))"
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let textFieldArray = textFields as NSArray
        let index = textFieldArray.indexOfObject(textField)
        
        if index < textFieldArray.count-1 {
            let newTextField = textFieldArray[index+1] as! UITextField
            newTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    

}

