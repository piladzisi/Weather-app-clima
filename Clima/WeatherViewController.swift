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

class WeatherViewController: UIViewController, CLLocationManagerDelegate {
    
   fileprivate let APP_ID = "5d3c281f8b7ece9515e8f1dac20c6b1b"
    
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
    }
    
    
    //getWeatherData method Codable:
    
//    func getWeatherData(url: String, parameters: [String: String], completion: @escaping (Result <Weather, Error>) -> ()) {
//       guard let url = URL(string: "\(WEATHER_URL)") else { return }
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            if let err = err {
//                completion(.failure(err))
//            }
//            do {
//                let data = data
//                print("success:\(data) \(url)")
//                let weather = try JSONDecoder().decode(Weather.self, from: data!)
//                DispatchQueue.main.async {
//                    completion(.success(weather))
//                    print(weather)
//                }
//            } catch let jsonError {
//                completion(.failure(jsonError))
//            }
//        } .resume()
//    }

               // self.cityLabel.text = "Connection Issues"
   


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

        let tempResults = json["base"]
        print(tempResults)
    }
    
    
    //MARK: - Location Manager Delegate Methods
    /***************************************************************/
    
    //Write the didUpdateLocations method here:
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
       
        if location.horizontalAccuracy > 0 {
            
            self.locationManager.stopUpdatingLocation() //save battery!!!
            locationManager.delegate = nil
            
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)
            
            let params: [String: String] = ["lat": latitude, "lon": longitude, "appid": APP_ID]
            getWeatherData(url: WEATHER_URL, parameters: params)
//            getWeatherData(url: WEATHER_URL, parameters: params) { (res) in
//                switch res {
//                case .success(let weather):
//                    self.weather = weather
//                case .failure(let err):
//                    print("Failed to fetch weather:", err)
//                }
//            }
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
    
    
    
    




}
