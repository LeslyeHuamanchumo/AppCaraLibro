//
//  GuardarLoginViewController.swift
//  AppCaraLibro
//
//  Created by user191303 on 6/22/22.
//

import UIKit

// tipo de autenticacion por usuario y contrasena
enum ProviderType: String {
    case basic
}

class GuardarLoginViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var proveedorLabel: UILabel!
    @IBOutlet weak var cerrarSesionButton: UIButton!
    
    private let email: String
    private let provider: ProviderType

    init(email: String, provider: ProviderType){
        self.email = email
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func cerrarSesionButtonAction(_ sender: Any) {
    }
    
}



