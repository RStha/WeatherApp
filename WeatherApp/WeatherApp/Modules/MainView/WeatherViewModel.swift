//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import Foundation

protocol WeatherDelegate {
    func populateTableView(weatherList: [List], cityName: String)
    func showErrorMessage(errorMessage:String)
}

class WeatherViewModel {
    
    //MARK: - Variables
    var delegate: WeatherDelegate?
    
    //MARK: - Network Request
    func fetchWeatherDetails(city: String) {
        WebService().GETRequest(city: city) { (success, weather: WeatherModel?, error) in
            if success {
                DispatchQueue.main.async {
                    guard let weatherList = weather?.list else {
                        return
                    }
                    self.delegate?.populateTableView(weatherList: weatherList, cityName: weather?.city.name ?? city)
                }
            } else {
                self.delegate?.showErrorMessage(errorMessage: error ?? ConstantString.unknownError)
            }
    
        }
    }
}

