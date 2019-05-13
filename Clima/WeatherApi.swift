//
//  WeatherApi.swift
//  Clima
//
//  Created by anna.sibirtseva on 13/05/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class WeatherApi {
    //Codable
    
    func getWeatherData(url: String, completion: @escaping (Result<Weather, Error>) -> ()) {
        guard let url = URL(string: WEATHER_URL) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(err))
                return
            }
            do {
                let weather = try JSONDecoder().decode(Weather.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(weather))
                    print(weather)
                }
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        } .resume()
    }
}
