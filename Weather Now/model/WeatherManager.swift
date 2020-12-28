//
//  WeatherManager.swift
//  Weather Now
//
//  Created by sadiq qasmi on 23/12/2020.
//

import Foundation
import CoreLocation
protocol  WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
}
struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=4ce9adc66b6ead234071388c63926e2d&units=metric"
    var delegate:WeatherManagerDelegate?
    
    func fetchWeather(cityname:String){
        let urlString = "\(weatherURL)&q=\(cityname)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    func fetchWeather(latitude:CLLocationDegrees , longitude:CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
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
            if let weather = self.parseJSON(weatherData: safedata){
                self.delegate?.didUpdateWeather(weather: weather)
            }
            //print(safedata)
        }
    }
    func parseJSON(weatherData: Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let name = decodedData.name
            let temp = decodedData.main.temp
            let weather = WeatherModel.init(conditionId: id, cityName: name, temp: temp)
//            print(weather.conditionName)
//            print(weather.tempString)
//            print(weather.cityName)
            
            return weather
            
        } catch{
            print(error)
            return nil
        }
    }
    
}
