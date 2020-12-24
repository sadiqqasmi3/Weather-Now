//
//  weatherManager.swift
//  Weather Now
//
//  Created by sadiq qasmi on 23/12/2020.
//

import Foundation
struct WeatherManager {
    let weatherURL = "http://api.openweathermap.org/data/2.5/weather?appid=4ce9adc66b6ead234071388c63926e2d&units=metric"
    func fetchWeather(cityname:String){
        let urlString = "\(weatherURL)&q=\(cityname)"
    }
}
