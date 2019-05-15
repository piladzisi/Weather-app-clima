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
        
        activateLayoutConstraints()
        
    }
    
    
    func activateLayoutConstraints(){
        let blur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.alpha = 0.5
        //blurView.frame = backgroundImage.frame
        
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            
            NSLayoutConstraint.activate([
                blurView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
                blurView.rightAnchor.constraint(equalTo: guide.rightAnchor),
                blurView.topAnchor.constraint(equalTo: guide.topAnchor),
                blurView.leftAnchor.constraint(equalTo: guide.leftAnchor)
                ])
        } else {
            NSLayoutConstraint.activate([
                blurView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.bottomAnchor),
                blurView.rightAnchor.constraint(equalTo: view.rightAnchor),
                blurView.topAnchor.constraint(equalTo: topLayoutGuide.topAnchor),
                blurView.leftAnchor.constraint(equalTo: view.leftAnchor)
                ])
            backgroundImage.addSubview(blurView)
        }
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
