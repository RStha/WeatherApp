//
//  BaseViewController.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import UIKit

class BaseViewController: UIViewController {

    func showAlert(title: String, message : String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }

}
