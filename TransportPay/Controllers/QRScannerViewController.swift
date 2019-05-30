//
//  FirstViewController.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/18/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import UIKit

struct QRData {
    var codeString: String?
}

class QRScannerViewController: UIViewController, QRScannerViewDelegate {
    
    @IBOutlet weak var scannerUIView: QRScannerView! {
        didSet {
            scannerUIView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scannerUIView.layer.cornerRadius = 15.0
        
        // Swipe Gesture
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        self.view.addGestureRecognizer(leftSwipe)
 
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            self.tabBarController!.selectedIndex -= 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !scannerUIView.isRunning {
            scannerUIView.startScanning()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if scannerUIView.isRunning {
            scannerUIView.stopScanning()
        }
    }
    
    func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            self.scannerUIView.startScanning()
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func qrScanningDidStop() {
        //presentAlert(withTitle: "Stopped", message: "Scanning Stopped. Please try again")
    }
    
    func qrScanningDidFail() {
        presentAlert(withTitle: "Error", message: "Scanning Failed. Please try again")
    }
    
    func qrScanningSucceededWithCode(_ str: String?) {
        presentAlert(withTitle: "Succeed", message: str!)
    }

}
