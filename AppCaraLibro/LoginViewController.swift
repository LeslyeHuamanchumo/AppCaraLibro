//
//  LoginViewController.swift
//  AppCaraLibro
//
//  Created by user191544 on 5/16/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var boton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        for family in UIFont.familyNames {
            print(family)
            for name in UIFont.fontNames(forFamilyName: family){
                print(name)
            }
        }
            
        setupView()
    }
    
    func setupView() {
        boton.layer.cornerRadius = 10
    }
}
