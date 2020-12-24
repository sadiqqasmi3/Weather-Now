//
//  WeatherManager.swift
//  Weather Now
//
//  Created by sadiq qasmi on 23/12/2020.
//

import Foundation
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4ce9adc66b6ead234071388c63926e2d&units=metric"
    func fetchWeather(cityname:String){
        let urlString = "\(weatherURL)&q=\(cityname)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString:String) {
        // create a url
        if let url = URL(string: urlString){
            
            // create a url session
            let session = URLSession(configuration: .default)
            // give it a task
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            // start the task
            task.resume()
        }
        
    }
    
    
    
    
    func handle(data: Data? , response: URLResponse? , error:Error?) -> Void {
        if error != nil {
            print(error!)
            return
        }
        
        if let safedata = data {
            let dataString = String(data: safedata, encoding: .utf8)
            print(dataString!)
        }
        
    }
}
