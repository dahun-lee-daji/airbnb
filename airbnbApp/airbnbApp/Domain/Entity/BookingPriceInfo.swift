//
//  BookingPriceInfo.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/27.
//

import Foundation

struct BookingPriceInfo: Codable {
      let discountPerWeek: Int
      let cleaningFee: Int
      let serviceFee: Int
      let tax: Int
      let totalPrice: Int
}
