//
//  ReservationConditions.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/24.
//

import Foundation

class ReservationConditions: Codable {
    let location: String
    var checkIn: String?
    var checkOut: String?
    var minPrice: Int?
    var maxPrice: Int?
    var personnel: Int? // only guest, 영아 미포함.
    
    init(location: String, checkIn: String? = nil, checkOut: String? = nil, minPrice : Int? = nil, maxPrice : Int? = nil, personnel : Int? = nil) {
        self.location = location
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.minPrice = minPrice
        self.maxPrice = maxPrice
        self.personnel = personnel
    }
}
