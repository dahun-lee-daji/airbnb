//
//  BookingInfo.swift
//  airbnbApp
//
//  Created by Jun Ho JANG on 2021/05/25.
//

import Foundation

struct BookingInfo: Codable {
    let bookingId: Int
    let checkIn: String
    let checkOut: String
    let roomId: Int
    let roomName: String
    let roomType: String
    let images: [String]
    let host: Host
    let guest: Int
    let totalPrice: Int
}
