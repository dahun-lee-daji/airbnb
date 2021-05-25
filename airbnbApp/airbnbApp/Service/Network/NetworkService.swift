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
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath().getMain())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getSearchPriceResult() -> Observable<[Int]> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(location: "seoul").getRegionalPriceForGraph())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getSearch() -> Observable<RoomInfo> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath().getSearchResult())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getRoom() -> Observable<RoomInfo> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(roomId: 1).getRoom())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getRoomPrice() -> Observable<RoomInfo> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(roomId: 1).getRoomPriceForPopUp())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getBookings() -> Observable<[BookingInfo]> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(userId: 1).getBookings())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getBooking() -> Observable<BookingInfo> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(userId: 1, bookingId: 1).getBooking())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
    
    func getWishlist() -> Observable<[RoomInfo]> {
        
        let header = HTTPHeaders.init(["Content-Type":"application/json"])
        
        let endPoint = EndPoint.init(method: .get, path: APIPath(userId: 1).wishListAPI())
        
        return networkRequester.get(endPoint: endPoint, header: header)
    }
}
