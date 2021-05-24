//
//  ReservationConditions.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/24.
//

import Foundation

class ReservationConditions {
    let location: String
    let checkIn: String?
    let checkOut: String?
    let minPrice: Int?
    let maxPrice: Int?
    let personnel: Int? // only guest, 영아 미포함.
}
