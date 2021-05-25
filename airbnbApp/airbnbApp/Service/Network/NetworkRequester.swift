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
    
    func get<T: Codable>(endPoint: EndPoint, header:  HTTPHeaders, parameters: [String: Codable]? = nil) -> Observable<T> {
        
        let url = endPoint.urlFromEndPoint()
        return Observable<T>.create({ observer in
            
            let dataRequest = AF.request(url, method: endPoint.method, parameters: parameters, encoding: JSONEncoding.default, headers: header)
            
            dataRequest.responseData(completionHandler: { response in
                switch response.result {
                case .success(let data):
                    do {
                        let model : T = try JSONDecoder().decode(T.self, from: data)
                        observer.onNext(model)
                    } catch {
                        print(error.localizedDescription)
                        print(url)
                        assertionFailure("\(NetworkErrors.decodingError)")
                    }
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
