//
//  WeatherData.swift
//  Weather Now
//
//  Created by sadiq qasmi on 24/12/2020.
//

import Foundation
struct WeatherData:Codable {
    let name :String
    var main :Main
    let weather:[Weather]
}

struct Main:Codable {
    let temp:Double
    
}
struct Weather:Codable {
    let description:String
    let id:Int
}
