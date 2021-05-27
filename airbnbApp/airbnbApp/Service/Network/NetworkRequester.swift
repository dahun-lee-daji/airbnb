//
//  NetworkRequester.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/25.
//

import Foundation
import RxSwift
import Alamofire

enum NetworkErrors : Error {
    case invalidURL
    case decodingError
}

class NetworkRequester {
    
    func get<T: Codable>(endPoint: EndPoint, parameters: [String: Codable]? = nil) -> Observable<T> {
        
        let url = endPoint.urlFromEndPoint()
        print(url)
        return Observable<T>.create({ observer in
            let dataRequest = AF.request(url, method: endPoint.method, parameters: parameters, encoding: URLEncoding.queryString)
            
            dataRequest.responseDecodable(of: T.self, completionHandler: { (response) in
                switch response.result {
                case .success(let data):
                    observer.onNext(data)
                case .failure(let error):
                    observer.onError(error)
                }
            })
            
            return Disposables.create {
                            dataRequest.cancel()
                        }
        })
    }
}
