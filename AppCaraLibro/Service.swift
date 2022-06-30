//
//  Service.swift
//  AppCaraLibro
//
//  Created by user191303 on 6/28/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class Service {
    
    static func signUpUser(email: String, password: String, name: String, onSuccess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let auth = Auth.auth()
        
        auth.createUser(withEmail: email, password: password) { (authResult, error) in
            if error != nil {
                onError(error!)
               
                return
            }
            upLoadToDatabase(email: email, name: name, onSuccess: onSuccess)
        }
    }
    
    // funcion cargamos a la database
    static func upLoadToDatabase(email: String, name: String, onSuccess: @escaping () -> Void) {
        let ref = Database.database().reference()
        let uid = Auth.auth().currentUser?.uid
        
        // Dentro de este hijo vamos a guardar la info de los usuarios
        ref.child("usuarios").child(uid!).setValue(["email": email, "name": name])
        onSuccess()
    }
    
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        return alert
    }
    
}
