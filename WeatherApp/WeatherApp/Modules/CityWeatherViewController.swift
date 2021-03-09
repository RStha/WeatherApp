//
//  CityWeatherViewController.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import UIKit

class CityWeatherViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Variables
    var weatherList: [List] = []
    private var selectedWeather: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.detailSegue {
            let vc = segue.destination as! WeatherDetailViewController
            vc.weather = selectedWeather
        }
    }
    
}

// MARK: - TableViewDataSource
extension CityWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.weatherCell) as! WeatherTableViewCell
        cell.configureCell(element: weatherList[indexPath.row])
        return cell
    }
    
}

// MARK: - TableViewDelegate
extension CityWeatherViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedWeather = weatherList[indexPath.row]
        performSegue(withIdentifier: Segue.detailSegue, sender: self)
    }
}

