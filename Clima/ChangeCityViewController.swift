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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let blur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.alpha = 0.5
        blurView.frame = backgroundImage.bounds
        backgroundImage.addSubview(blurView)
        
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
