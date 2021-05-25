//
//  BookingInfo.swift
//  airbnbApp
//
//  Created by Jun Ho JANG on 2021/05/25.
//

import Foundation

struct BookingInfo: Codable {
    let booking_id: Int
    let check_in: String
    let check_out: String
    let room_id: Int
    let room_name: String
    let room_type: String
    let images: [String]
    let host: Host
    let guest: Int
    let total_price: Int
}
