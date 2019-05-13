//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    var weatherApi = WeatherApi()
    var weather: Weather!
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        let url = WEATHER_URL
        getCurrentWeather(url: url)
    }
    
        func getCurrentWeather(url: String) {
            weatherApi.getWeatherData(url: url) { (res) in
                switch res {
                case .success(let weather):
                    self.setupView(weather: weather)
                    self.weather = weather
                case .failure(let err):
                    print("Failed to fetch weather:", err)
                }
            }
    }
    
        func setupView(weather: Weather) {
            cityLabel.text = weather.city
            temperatureLabel.text = String(weather.temp)
          
        }
 
    
    //Write the updateWeatherData method here:
    
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if var destination = segue.destination as? WeatherViewController {
                destination.weather = weather
            }
            
        }

    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0 {
            locationManager.startUpdatingLocation() //save battery!!!
            
            print("longitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            let params: [String : String] = ["lat" : latitude, " lon" : longitude, "appid" : APP_ID]
         }
    }
    
    //Write the didFailWithError method here:
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
}
    

    
    //MARK: - Change City Delegate methods
    /***************************************************************/
    
    
    //Write the userEnteredANewCityName Delegate method here:
    

    
    //Write the PrepareForSegue Method here
    
    
    
    



