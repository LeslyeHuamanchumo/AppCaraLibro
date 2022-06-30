//
//  Service.swift
//  AppCaraLibro
//
//  Created by user191303 on 6/28/22.
//

import UIKit

class Service {
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        return alert
    }
    
}
