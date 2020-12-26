//
//  WeatherViewController.swift
//  Weather Now
//
//  Created by sadiq qasmi on 23/12/2020.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
   
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conditionImage: UIImageView!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var searchField: UITextField!
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherManager.delegate = self
        searchField.delegate = self
    }
   
    @IBAction func searchButton(_ sender: Any) {
        print(searchField.text!)
        searchField.endEditing(true)
        
        
    }
    
    @IBAction func currentLocationButton(_ sender: Any) {
        
    }
    
}

//MARK: -TextFieldDelegate
extension WeatherViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text {
            weatherManager.fetchWeather(cityname: city)
        }
        searchField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            textField.placeholder = "Type something"
            return false
        }
        textField.placeholder = "Search"
        return true
    }
}

//MARK: -WeatherManagerDelegate
extension WeatherViewController: WeatherManagerDelegate{
    
    func didUpdateWeather(weather: WeatherModel) {
        DispatchQueue.main.async {
            self.locationLabel.text = weather.cityName
            self.conditionImage.image = UIImage.init(systemName: weather.conditionName)
            self.tempLabel.text = weather.tempString
            
        }
    }
}
