//
//  ViewController.swift
//  WeatherApp
//
//  Created by Angela Yu on 23/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import Charts

class WeatherViewController: UIViewController, CLLocationManagerDelegate, ChangeCityDelegate {
    
   fileprivate let APP_ID = "5d3c281f8b7ece9515e8f1dac20c6b1b"
    
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
    @IBOutlet weak var celciusSwitch: UISwitch!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pieChart: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        celciusSwitch.isOn = false
        
    }
  
 // getWeatherData method Alamofire and SwiftyJSON:

    func getWeatherData(url: String, parameters: [String: String]) {

        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                let weatherJSON: JSON = JSON(response.result.value!)
                self.updateWeatherData(json: weatherJSON)
            }
            else {
                print("Error \(String(describing: response.result.error))")
                self.cityLabel.text = "Connection Issues"
            }
        }
    }
    
    //Write the updateWeatherData method here:
    
    func updateWeatherData(json: JSON) {
        if let tempResults = json["main"]["temp"].double, let humidityResults = json["main"]["humidity"].double {
        weatherDataModel.temperature = Int(tempResults - 273.15)
        weatherDataModel.humidity = Int(humidityResults)
        weatherDataModel.city = json["name"].stringValue
        weatherDataModel.condition = json["weather"][0]["id"].intValue
        weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            
        updateUIWithWeatherData()
        pieChartUpdate()
        }
        else {
            cityLabel.text = "Weather Unavailable"
        }
    }
    
    //MARK: - UI Updates
    
    func updateUIWithWeatherData() {
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = String(weatherDataModel.temperature)+"℃"
        weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
        humidityLabel.text = String(weatherDataModel.humidity)+"%"
    }
    
    
    
    //MARK: - Location Manager Delegate Methods
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
       
        if location.horizontalAccuracy > 0 {
            
            self.locationManager.stopUpdatingLocation() //save battery!!!
            locationManager.delegate = nil
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params: [String: String] = ["lat": latitude, "lon": longitude, "appid": APP_ID]
            getWeatherData(url: WEATHER_URL, parameters: params)
          }
    }
    
   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }

    
  //MARK: - Change City Delegate methods

    
    func userEnteredNewCity(city: String) {
        let params: [String : String] = ["q" : city, "appid" : APP_ID]
        getWeatherData(url: WEATHER_URL, parameters: params)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "changeCityName" {
            let destinationVC = segue.destination as! ChangeCityViewController
            destinationVC.delegate = self
            
        }
    }
 
    @IBAction func celciusSwitchClicked(_ sender: Any) {
        if celciusSwitch.isOn {
            temperatureLabel.text = String(weatherDataModel.temperature * 9/5 + 32)+"℉"
        } else {
            temperatureLabel.text = String(weatherDataModel.temperature)+"℃"
        }
    }
    
    //MARK Charts
    func pieChartUpdate() {
        
    }
}
