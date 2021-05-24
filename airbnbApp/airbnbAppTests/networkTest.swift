//
//  networkTest.swift
//  airbnbAppTests
//
//  Created by 이다훈 on 2021/05/21.
//

import XCTest
@testable import airbnbApp

class networkTest: XCTestCase {

    func test_APIPath_getMain() {
        let path = APIPath()
        
        XCTAssertEqual(path.getMain(), "/main")
    }
    
    func test_APIPath_getRegionalPriceForGraph() {
        
    }

    func test_APIPath_getSearchResult() {
        
    }
}
