//
//  WaetherModel.swift
//  Weather Now
//
//  Created by sadiq qasmi on 24/12/2020.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName:String
    let temp:Double
    
    var tempString: String{
        return String(format: "%.1fºC", temp)
    }
    
    
    var conditionName:String{
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "cloud"
        case 801...804:
            return "smoke"
        default:
            return "cloud"
        }
    }
    
    
}
