//
//  WeatherViewController+alertController.swift
//  WeatherApp
//
//  Created by Anikin Ilya on 22.12.2022.
//

import UIKit

// MARK: - WeatherViewController+alertController
extension WeatherViewController {
    
    // MARK: - Public Methods
    func presentSearchAlertController(withTitle title: String?,
                                      message: String?,
                                      style: UIAlertController.Style,
                                      completion: @escaping (String) -> Void ) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completion(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
