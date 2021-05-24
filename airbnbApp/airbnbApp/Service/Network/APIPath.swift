//
//  APIPath.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/21.
//

import Foundation

struct APIPath {
    
    private let roomId : Int?
    private let userId : Int?
    private let bookingId : Int?
    private let location : Int?
    
    init(roomId: Int? = nil, userId: Int? = nil, bookingId: Int? = nil, location: Int? = nil) {
        self.roomId = roomId
        self.userId = userId
        self.bookingId = bookingId
        self.location = location
    }
    
    func getMain() -> String {
        return "/main"
    }
    
    func getRegionalPriceForGraph() -> String {
        guard location != nil else {
            return "" // 예외처리 필요
        }
        return "/search/price/\(location)"
    }
    
    func getSearchResult() -> String {
        "/search"
    }
    
    func getRoom() -> String {
        guard roomId != nil else {
            return ""
        }
        return "/rooms/\(roomId)"
    }
    
    func getRoomPriceForPopUp() -> String {
        guard roomId != nil else {
            return ""
        }
        return "/rooms/\(roomId)/price"
    }
    
}
