//
//  NetworkService.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/25.
//

import Foundation
import RxSwift
import Alamofire

class NetworkService {
    
    let networkRequester = NetworkRequester()
    
    func getMain() -> Observable<MainViewSource> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath().getMain())
        
        return networkRequester.get(endPoint: endPoint)
    }
    
    func getSearchPriceResult() -> Observable<[Int]> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(location: "seoul").getRegionalPriceForGraph())
        
        return networkRequester.get(endPoint: endPoint)
    }
    
    func getSearch(conditions: ReservationConditions) -> Observable<[RoomInfo]> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath().getSearchResult())
        let param = ["location":conditions.location,
                     "checkIn":conditions.checkIn!,
                     "checkOut":conditions.checkOut!,
                     "minPrice":conditions.minPrice!,
                     "maxPrice":conditions.maxPrice!,
                     "guest":conditions.personnel!
        ] as [String : Codable]
        return networkRequester.get(endPoint: endPoint, parameters: param)
    }
    
    func getRoom() -> Observable<RoomInfo> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(roomId: 1).getRoom())
        
        return networkRequester.get(endPoint: endPoint)
    }
    
    func getRoomPrice(conditions: ReservationConditions) -> Observable<BookingPriceInfo> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(roomId: 1).getRoomPriceForPopUp())
        
        let param = ["checkIn":conditions.checkIn!,
                     "checkOut":conditions.checkOut!,
                     "guest":conditions.personnel!
        ] as [String : Codable]
        
        return networkRequester.get(endPoint: endPoint, parameters: param)
    }
    
    func getBookings() -> Observable<[BookingInfo]> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(userId: 1).getBookings())
        
        return networkRequester.get(endPoint: endPoint)
    }
    
    func getBooking() -> Observable<BookingInfo> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(userId: 1, bookingId: 1).getBooking())
        
        return networkRequester.get(endPoint: endPoint)
    }
    
    func getWishlist() -> Observable<[RoomInfo]> {
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(userId: 1).wishListAPI())
        
        return networkRequester.get(endPoint: endPoint)
    }
}
