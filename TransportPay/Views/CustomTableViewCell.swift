//
//  CustomTableViewCell.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/29/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    // Create Back View of every Cell
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 20.0, y: 10.0, width: self.frame.width - 40.0, height: 80.0))
        view.backgroundColor = UIColor.white
        
        return view
    }()
    
    // Create Ticket Name Label
    lazy var ticketName: UILabel = {
        let ticketNameLabel = UILabel(frame: CGRect(x: 20.0, y: 15.0, width: 120.0, height: 20.0))
        ticketNameLabel.textAlignment = .left
        ticketNameLabel.textColor = #colorLiteral(red: 0.3207525611, green: 0.3255720735, blue: 0.3298329413, alpha: 1)
        ticketNameLabel.font = UIFont(name: "Arial", size: 16.0)
        
        return ticketNameLabel
    }()
    
    lazy var ticketArrow: UIImageView = {
       let ticketArrowImage = UIImageView(frame: CGRect(x: backView.frame.width - 35, y: 15.0, width: 10.0, height: 15.0))
       ticketArrowImage.image = UIImage(named: "grayArrow.png")
       ticketArrowImage.contentMode = .scaleAspectFit
        
       return ticketArrowImage
    }()
    
    lazy var ticketDate: UILabel = {
        let ticketDateLabel = UILabel(frame: CGRect(x: 20.0, y: 50.0, width: 90.0, height: 15.0))
        ticketDateLabel.textAlignment = .left
        ticketDateLabel.textColor = #colorLiteral(red: 0.7035458684, green: 0, blue: 0.5579680204, alpha: 1)
        ticketDateLabel.font = UIFont(name: "Arial", size: 14.0)
        
        return ticketDateLabel
    }()
    
    lazy var ticketTime: UILabel = {
       let ticketTimeLabel = UILabel(frame: CGRect(x: 110.0, y: 50.0, width: 50.0, height: 15.0))
       ticketTimeLabel.textAlignment = .left
       ticketTimeLabel.textColor = #colorLiteral(red: 0.7035458684, green: 0, blue: 0.5579680204, alpha: 1)
       ticketTimeLabel.font = UIFont(name: "Arial", size: 14.0)
        
       return ticketTimeLabel
    }()
    
    lazy var ticketPrice: UILabel = {
       let ticketPriceLabel = UILabel(frame: CGRect(x: backView.frame.width - 70, y: 50.0, width: 50.0, height: 15.0))
       ticketPriceLabel.textAlignment = .right
       ticketPriceLabel.textColor = #colorLiteral(red: 0.7035458684, green: 0, blue: 0.5579680204, alpha: 1)
       ticketPriceLabel.font = UIFont(name: "Arial", size: 14.0)
        
       return ticketPriceLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        contentView.backgroundColor = UIColor.clear
        backgroundColor = #colorLiteral(red: 0.9505010247, green: 0.9649444222, blue: 0.9777460694, alpha: 1)
        backView.layer.cornerRadius = 10.0
        backView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        addSubview(backView)
        backView.addSubview(ticketName)
        backView.addSubview(ticketArrow)
        backView.addSubview(ticketDate)
        backView.addSubview(ticketTime)
        backView.addSubview(ticketPrice)
    }

}
