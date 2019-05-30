//
//  BaseTabBarController.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/21/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    @IBInspectable var defaultIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        selectedIndex = defaultIndex
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
