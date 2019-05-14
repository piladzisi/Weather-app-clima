//
//  WeatherApi.swift
//  Clima
//
//  Created by anna.sibirtseva on 13/05/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherApi {
    
    
    
    }
    
    //Codable
//    
//    fileprivate let weatherApiKey = "5d3c281f8b7ece9515e8f1dac20c6b1b"
//    
//    lazy var baseUrl: URL = {
//        return URL(string: "http://api.openweathermap.org/data/2.5/weather/appid=\(self.weatherApiKey)/")!
//    
//    }()
//    
//    
//    func getWeatherData(at coordinate: Coordinate, completionHandler completion: @escaping (Result<Weather, Error>) -> ()) {
//        
//        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else { return }
//        print(url)
//        URLSession.shared.dataTask(with: url) { (data, resp, err) in
//            
//           if let err = err {
//                completion(.failure(err))
//                return
//            }
//            do {
//                let weather = try JSONDecoder().decode(Weather.self, from: data!)
//                DispatchQueue.main.async {
//                    completion(.success(weather))
//                    print(weather)
//                 }
//            } catch let jsonError {
//                completion(.failure(jsonError))
//            }
//        } .resume()
//    }

