//
//  WebService.swift
//  WeatherApp
//
//  Created by fm-pc-lt-29/Ruji on 3/9/21.
//

import Foundation

class WebService {
    
    //MARK: - Variables
    var dataTask: URLSessionDataTask?
    var errorMessage = ""
    
    //MARK: - Constants
    let defaultSession = URLSession(configuration: .default)
    
    //MARK: - Network Requests
    /**
     Sends a GET Request
     - parameter url : String URL
     - parameter completion : Closure called with response, a generic object
     - returns : No Return Value
     */
    func GETRequest<T: Codable>(city: String, completion: @escaping (
                                    _ success: Bool,
                                    _ response: T?,
                                    _ error: String?) -> Void) {
        dataTask?.cancel()
        
        guard let urlString = "https://api.openweathermap.org/data/2.5/forecast?appid=65d00499677e59496ca2f318eb68c049&q=\(city)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        dataTask = defaultSession.dataTask(with: url) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                self?.errorMessage = error.localizedDescription
                completion(false, nil, self?.errorMessage)
            } else if let data = data {
                
                if let decodedResponse = try? JSONDecoder().decode(T.self, from: data) {
                    completion(true, decodedResponse, nil)
                } else if let errorResponse = try? JSONDecoder().decode(Error.self, from: data) {
                    completion(false, nil, errorResponse.message)
                } else {
                    completion(false, nil, ConstantString.unknownError)
                }
            } else {
                completion(false, nil, ConstantString.unknownError )
            }
        }
        
        dataTask?.resume()
    }
    
}

