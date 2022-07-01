//
//  ResetPassViewController.swift
//  AppCaraLibro
//
//  Created by user191303 on 6/30/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ResetPassViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardNotifications()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardNotifications()
    }
    
    @IBAction func resetPassButton(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: email.text!) { (error) in
            if let error = error {
                let alert = Service.createAlertController(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
            let alert = Service.createAlertController(title: "Excelente", message: "Enviamos un correo para reestablecer tu contrasena")
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
    extension ResetPassViewController {
        
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
