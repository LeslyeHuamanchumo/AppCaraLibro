//
//  NewUserViewController.swift
//  AppCaraLibro
//
//  Created by user191544 on 5/16/22.
//

import UIKit
import FirebaseAuth


class NewUserViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet private weak var anchorBottomScroll: NSLayoutConstraint!
    
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
    
    @IBAction func signUpButtonAction (_ sender: Any) {
        let auth = Auth.auth()
        
        auth.createUser(withEmail: email.text!, password: password.text!) { (authResult, error) in
            if error != nil {
                self.present(Service.createAlertController(title: "Error", message: error!.localizedDescription), animated: true, completion: nil)
                return
            }
            self.performSegue(withIdentifier: "userSignedUpSegue", sender: nil)  // tengo dudas
        }
    } 
    
}

extension NewUserViewController {
        
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
        NotificationCenter.default.removeObserver(self)
    }
        
    @objc private func keyboardWillShow(_ notification: Notification) {
            
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomScroll.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
        
    @objc private func keyboardWillHide(_ notification: Notification) {
            
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}
