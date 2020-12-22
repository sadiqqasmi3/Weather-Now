//
//  WeatherViewController.swift
//  Weather Now
//
//  Created by sadiq qasmi on 23/12/2020.
//

import UIKit

class WeatherViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var searchField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func searchButton(_ sender: Any) {
        print(searchField.text!)
        searchField.endEditing(true)
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
      
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
