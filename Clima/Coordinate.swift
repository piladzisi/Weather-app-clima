//
//  Coordinate.swift
//  Clima
//
//  Created by anna.sibirtseva on 13/05/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation


struct Coordinate {
    let latitude: Double
    let longitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
    
    static var alcatrazIsland: Coordinate {
        return Coordinate(latitude: 53.8267, longitude: -62.4233)
    }
}

