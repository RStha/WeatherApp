//
//  WeatherTableViewCell.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var weatherLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(element: List) {
        weatherLbl.text = element.weather[0].main
        tempLbl.text = "Temp: \(element.main.tempInFahrenheit)"
    }

}
