//
//  LoginViewController.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/18/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import UIKit
import iOSDropDown

// Adding Done & Cancel buttons to the Number Keyboard
extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var numberTextField: UITextField! {
        didSet { numberTextField?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var countriesDropDown: DropDown!
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundOne()

        // Do any additional setup after loading the view.
        
        
        //signUpButton.layer.cornerRadius = 18
        
        numberTextField.attributedPlaceholder = NSAttributedString(string:"Enter your phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        // The list of array to display. Can be changed dynamically
        countriesDropDown.optionArray = ["Belarus", "Estonia", "Russia"]
        
        // The Closure returns Selected Index and String
        countriesDropDown.didSelect{(selectedText , index ,id) in
            self.countriesDropDown.text = "\(selectedText)"
        }
        
        
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "myLoginIdentifier", sender: self)
    }
    
    // Keyboard Activity
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numberTextField.resignFirstResponder()
        return true
    }
    
    // Status bar light style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

    func setBackgroundOne() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "background")
        
        view.sendSubviewToBack(backgroundImageView)
        
    }

}
