//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit


//Write the protocol declaration here:
protocol ChangeCityDelegate {
    func userEnteredNewCity (city: String)
}

class ChangeCityViewController: UIViewController {
    var delegate: ChangeCityDelegate?
    
    @IBOutlet weak var changeCityTextField: UITextField!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var getWeatherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.backgroundColor = .black
        blurView.alpha = 0.4
        getWeatherButton.layer.borderWidth = 1
        getWeatherButton.layer.borderColor = UIColor.white.cgColor
        getWeatherButton.layer.cornerRadius = 15
        changeCityTextField.layer.cornerRadius = 15
        
    }
 
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
      
       let cityName = changeCityTextField.text!
        
        delegate?.userEnteredNewCity(city: cityName)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
