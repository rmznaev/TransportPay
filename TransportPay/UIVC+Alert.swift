//
//  UIVC+Alert.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/30/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
