//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f",  sender.value)
        heightLabel.text = "\(height)m"
    }
    @IBAction func weightSlider(_ sender: UISlider) {
        let weight = String(format: "%.0f",  sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    @IBAction func calculateButtom(_ sender: UIButton) {
        calculatorBrain.calculateBMI(weightSlider.value, heightSlider.value)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    //This method gets triggered just before the segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //If the currently triggered segue is the "goToResults" segue.
        if segue.identifier == "goToResults" {
            //Get hold of the instance of the destination VC and type cast it to a ResultViewController.
            let destinationVC = segue.destination as! ResultViewController
            //Set the destination ResultsViewController's properties.
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

