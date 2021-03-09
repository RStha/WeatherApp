//
//  WeatherDetailViewController.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var feelsLikeLbl: UILabel!
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var weatherDetailLbl: UILabel!
    
    // MARK: - Variables
    var weather: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    func populateView() {
        guard let weather = weather else {
            return
        }
        tempLbl.text = "\(weather.main.tempInFahrenheit)"
        feelsLikeLbl.text = "Feels like \(weather.main.feelsLikeInFahrenheit)"
        weatherLbl.text = weather.weather.first?.main ?? ""
        weatherDetailLbl.text = weather.weather.first?.weatherDescription ?? ""
    }
}

