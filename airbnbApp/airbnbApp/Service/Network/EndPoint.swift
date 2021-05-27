//
//  EndPoint.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/21.
//

import Foundation
import Alamofire

struct EndPoint: URLConvertible {
    
    let method: HTTPMethod
    let path : String
    
    init(method: HTTPMethod, path: String) {
        self.method = method
        self.path = path
    }
    
    func asURL() throws -> URL {
        var component = URLComponents()
        component.scheme = "http"
        component.host = "52.78.20.134"
        component.port = 8080
        component.path = path
        guard component.url != nil else {
            throw NetworkErrors.invalidURL
        }
        
        return component.url!
    }
    
    func urlFromEndPoint() -> URL {
        var url = URL.init(string: "http//52.78.20.134:8080")!
        
        do {
             url = try self.asURL()
        } catch {
            assertionFailure(error.localizedDescription)
        }
        
        return url
    }
}
