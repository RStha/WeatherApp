//
//  ViewController.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import UIKit

class ViewController: BaseViewController {
    
    // MARK: - Constants
    private let weatherModel = WeatherViewModel()
    
    // MARK: - Variables
    private var weather:[List] = []
    
    // MARK: - IBOutlets
    @IBOutlet weak var cityTF: UITextField!
    
    // MARK: - IBAction Methods
    @IBAction func lookUpWeather(_ sender: Any) {
        guard let city = cityTF.text else {
            return
        }
        weatherModel.fetchWeatherDetails(city: city)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherModel.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Navigation Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.citySegue {
            let vc = segue.destination as! CityWeatherViewController
            vc.weatherList = weather
        }
    }
}

// MARK: - WeatherDelegate Method
extension ViewController: WeatherDelegate {
    
    func populateTableView(weatherList: [List], cityName: String) {
        self.title = cityName
        weather = weatherList
        performSegue(withIdentifier: Segue.citySegue, sender: self)
    }
    
    func showErrorMessage(errorMessage: String) {
        DispatchQueue.main.async {
            self.showAlert(title: ConstantString.error, message: errorMessage)
        }
    }
    
}


