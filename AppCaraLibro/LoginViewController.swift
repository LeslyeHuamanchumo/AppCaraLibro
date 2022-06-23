//
//  LoginViewController.swift
//  AppCaraLibro
//
//  Created by user191544 on 5/16/22.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var singup: UIButton!
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Aunticacion"
        
        // Analitics Event
        Analytics.logEvent("InitScreen", parameters: ["mensaje":"Integracion de firebase completa"])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    // falta validacion si la contrase;a es correcta
    @IBAction func signUpButtonAction(_ sender: Any) {
        
        if let email = email.text, let password = password.text{
            Auth.auth().createUser(withEmail: email, password: password) {
                (result, error) in
                if let result = result, error == nil {
                    
                    self.navigationController?.pushViewController(GuardarLoginViewController(email: result.user.email!, provider: .basic), animated: true)
                    
                }else{   // marcar'a que se ha producido un error
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        if let email = email.text, let password = password.text{
            Auth.auth().signIn(withEmail: email, password: password) {
                (result, error) in
                if let result = result, error == nil {
                    
                    self.navigationController?.pushViewController(GuardarLoginViewController(email: result.user.email!, provider: .basic), animated: true)
                    
                }else{   // marcar'a que se ha producido un error
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
}

    extension LoginViewController {
        
        private func registerKeyboardNotifications() {
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardWillShow(_:)),
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardWillHide(_:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
        }
        
        private func unregisterKeyboardNotifications() {
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        @objc private func keyboardWillShow(_ notification: Notification) {
            print(notification.userInfo ?? "sin data")
        }
        
        @objc private func keyboardWillHide(_ notification: Notification) {
            print("teclado desaparece")
        }
}
