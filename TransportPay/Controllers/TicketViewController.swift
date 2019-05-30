//
//  SecondViewController.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/18/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController, UIScrollViewDelegate {
    
    // Create Table View
    let tableView = UITableView()
    
    // Create Ticket Image View
    let ticketImage = UIImageView()
    
    // Create an Array for Cells
    var ticketNameArray = [TicketDetails]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Swipe Gesture
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
        
        // Set Table View
        setTableView()
        
        ticketNameArray.append(TicketDetails(ticketName: "Bus 79", ticketDate: "11/03/2017", ticketTime: "14:33", ticketPrice: "$0.30"))
        ticketNameArray.append(TicketDetails(ticketName: "Trum 1", ticketDate: "11/03/2017", ticketTime: "14:33", ticketPrice: "$0.25"))
        ticketNameArray.append(TicketDetails(ticketName: "Trolleybus 33", ticketDate: "10/03/2017", ticketTime: "12:06", ticketPrice: "$0.30"))
        ticketNameArray.append(TicketDetails(ticketName: "Bus 12", ticketDate: "09/03/2017", ticketTime: "8:12", ticketPrice: "$0.30"))
    
        // Clear top border of the Tab Bar
        self.tabBarController!.tabBar.layer.borderWidth = 0.50
        self.tabBarController!.tabBar.layer.borderColor = UIColor.clear.cgColor
        self.tabBarController?.tabBar.clipsToBounds = true
        
        // Create Ticket image
        
        ticketImage.image = UIImage(named: "ticket.png")
        ticketImage.contentMode = .scaleToFill
        
        self.view.addSubview(ticketImage)
        
        let safeGuide = self.view.safeAreaLayoutGuide
        
        ticketImage.translatesAutoresizingMaskIntoConstraints = false
        
        ticketImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0).isActive = true
        ticketImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0).isActive = true
        ticketImage.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 20.0).isActive = true
        ticketImage.heightAnchor.constraint(equalToConstant: 180.0).isActive = true
        
        // Create red top part of ticket
        let topRedImage = UIImageView()
        topRedImage.image = UIImage(named: "topPart.png")
        topRedImage.contentMode = .scaleAspectFill
        
        ticketImage.addSubview(topRedImage)
        
        topRedImage.translatesAutoresizingMaskIntoConstraints = false
        
        topRedImage.leadingAnchor.constraint(equalTo: ticketImage.leadingAnchor, constant: 0.0).isActive = true
        topRedImage.trailingAnchor.constraint(equalTo: ticketImage.trailingAnchor, constant: 0.0).isActive = true
        topRedImage.topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: 26.0).isActive = true
        topRedImage.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        // Create Name Label
        let nameLabel = UILabel()
        nameLabel.text = "Bus 123"
        nameLabel.textColor = UIColor.white
        nameLabel.font = UIFont(name: "Arial", size: 12.0)
        
        topRedImage.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: topRedImage.leadingAnchor, constant: 15.0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: ticketImage.topAnchor, constant: 3.0).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        
        // Create Down Arrow button
        let ticketArrowButton = UIButton()
        let imageForTicketArrowButton = UIImage(named: "ticketArrow.png") as UIImage?
        ticketArrowButton.setImage(imageForTicketArrowButton, for: .normal)
        
        topRedImage.addSubview(ticketArrowButton)
        
        ticketArrowButton.translatesAutoresizingMaskIntoConstraints = false
        
        ticketArrowButton.trailingAnchor.constraint(equalTo: ticketImage.trailingAnchor, constant: -15.0).isActive = true
        ticketArrowButton.topAnchor.constraint(equalTo: ticketImage.topAnchor, constant: 15.0).isActive = true
        ticketArrowButton.widthAnchor.constraint(equalToConstant: 13.0).isActive = true
        ticketArrowButton.heightAnchor.constraint(equalToConstant: 7.0).isActive = true
        
        // Create Dotted Line Image
        let dottedLineImage = UIImageView()
        dottedLineImage.image = UIImage(named: "dottedLine.png")
        dottedLineImage.contentMode = .scaleToFill
        
        ticketImage.addSubview(dottedLineImage)
        
        dottedLineImage.translatesAutoresizingMaskIntoConstraints = false
        
        dottedLineImage.topAnchor.constraint(equalTo: ticketImage.topAnchor, constant: 75.0).isActive = true
        dottedLineImage.leadingAnchor.constraint(equalTo: ticketImage.leadingAnchor, constant: 10.0).isActive = true
        dottedLineImage.trailingAnchor.constraint(equalTo: ticketImage.trailingAnchor, constant: -10.0).isActive = true
        dottedLineImage.heightAnchor.constraint(equalToConstant: 1.0).isActive = true
        
        // Create Date Label
        let ticketDateLabel = UILabel()
        ticketDateLabel.text = "12/03/2017"
        ticketDateLabel.textColor = #colorLiteral(red: 0.7035458684, green: 0, blue: 0.5579680204, alpha: 1)
        ticketDateLabel.font = UIFont(name: "Arial", size: 10.0)
        
        ticketImage.addSubview(ticketDateLabel)
        
        ticketDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ticketDateLabel.leadingAnchor.constraint(equalTo: ticketImage.leadingAnchor, constant: 15.0).isActive = true
        ticketDateLabel.topAnchor.constraint(equalTo: ticketImage.topAnchor, constant: 45.0).isActive = true
        ticketDateLabel.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        ticketDateLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        // Create Amount Label
        let ticketFee = UILabel()
        ticketFee.text = "$0.30"
        ticketFee.textColor = #colorLiteral(red: 0.7035458684, green: 0, blue: 0.5579680204, alpha: 1)
        ticketFee.font = UIFont(name: "Arial", size: 10.0)
        
        ticketImage.addSubview(ticketFee)
        
        ticketFee.translatesAutoresizingMaskIntoConstraints = false
        
        ticketFee.trailingAnchor.constraint(equalTo: ticketImage.trailingAnchor, constant: -15.0).isActive = true
        ticketFee.topAnchor.constraint(equalTo: ticketImage.topAnchor, constant: 45.0).isActive = true
        ticketFee.widthAnchor.constraint(equalToConstant: 26.0).isActive = true
        ticketFee.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        // Create Barcode Image
        let barcodeImage = UIImageView()
        barcodeImage.image = UIImage(named: "barcode.png")
        barcodeImage.contentMode = .scaleAspectFit
        
        ticketImage.addSubview(barcodeImage)
        
        barcodeImage.translatesAutoresizingMaskIntoConstraints = false
        
        barcodeImage.topAnchor.constraint(equalTo: dottedLineImage.bottomAnchor, constant: 15.0).isActive = true
        barcodeImage.leadingAnchor.constraint(equalTo: ticketImage.leadingAnchor, constant: 25.0).isActive = true
        barcodeImage.trailingAnchor.constraint(equalTo: ticketImage.trailingAnchor, constant: -25.0).isActive = true
        barcodeImage.heightAnchor.constraint(equalToConstant: 45.0).isActive = true
        
        // Create Expire Time Label
        let expireTimeLabel = UILabel()
        expireTimeLabel.text = "Ticket will expire at 12:41"
        expireTimeLabel.textColor = #colorLiteral(red: 0.4899380803, green: 0.5142450929, blue: 0.526946485, alpha: 1)
        expireTimeLabel.font = UIFont(name: "Arial", size: 12.0)
        expireTimeLabel.textAlignment = .center
        
        ticketImage.addSubview(expireTimeLabel)
        
        expireTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        expireTimeLabel.topAnchor.constraint(equalTo: dottedLineImage.bottomAnchor, constant: 70.0).isActive = true
        expireTimeLabel.centerXAnchor.constraint(equalTo: ticketImage.centerXAnchor).isActive = true
        expireTimeLabel.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
        if sender.direction == .left {
            self.tabBarController!.selectedIndex += 1
        }
        if sender.direction == .right {
            self.tabBarController!.selectedIndex -= 1
        }
    }
    
    func setTableView() {
        tableView.frame = self.view.frame
        tableView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9647058824, blue: 0.9764705882, alpha: 1)
        tableView.separatorColor = UIColor.clear
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.allowsSelection = false
        
        self.view.addSubview(tableView)
        
        // Will create Cell Class
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 220.0).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

}

extension TicketViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else { fatalError("Unable to create cell!") }
        cell.ticketName.text = ticketNameArray[indexPath.row].ticketName
        cell.ticketDate.text = ticketNameArray[indexPath.row].ticketDate
        cell.ticketTime.text = ticketNameArray[indexPath.row].ticketTime
        cell.ticketPrice.text = ticketNameArray[indexPath.row].ticketPrice
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}
