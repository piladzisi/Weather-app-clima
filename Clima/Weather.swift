//
//  Weather.swift
//  Clima
//
//  Created by anna.sibirtseva on 14/05/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct Main: Decodable {
    let main: Int
}

struct Weather: Decodable {
    let temperature: Int
    let condition: Int
    let city: String
    let weatherIconName: String
}
    
    //
    //    init(model: CurrentWeather) {
    //        let roundedTemperature = Int(model.temperature)
    //        self.temperature = "\(roundedTemperature)º"
    //
    //        let humidityPercentValue = Int(model.humidity * 100)
    //        self.humidity = "\(humidityPercentValue)%"
    //
    //        let precipitationPercentValue = Int(model.precipProbability * 100)
    //        self.precipitationProbability = "\(precipitationPercentValue)%"
    //
    //        self.summary = model.summary
    //        self.icon = model.iconImage






