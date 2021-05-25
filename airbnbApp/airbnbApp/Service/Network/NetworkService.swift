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
}
