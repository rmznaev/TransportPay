//
//  TicketDetails.swift
//  TransportPay
//
//  Created by Ramazan Abdullayev on 5/29/19.
//  Copyright © 2019 Ramazan Abdullayev. All rights reserved.
//

import Foundation

class TicketDetails {
    var ticketName: String?
    var ticketDate: String?
    var ticketTime: String?
    var ticketPrice: String?
    
    init(ticketName: String, ticketDate: String, ticketTime: String, ticketPrice: String) {
        self.ticketName = ticketName
        self.ticketDate = ticketDate
        self.ticketTime = ticketTime
        self.ticketPrice = ticketPrice
    }
    
}
