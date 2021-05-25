//
//  MainViewSource.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/24.
//

import Foundation

struct MainViewSource: Codable {
    let hero_banners: [HeroBanner]
    let near_destinations: [NearDestination]
}

struct HeroBanner: Codable {
    private let image : String
    private let title : String
}

struct NearDestination: Codable {
    private let image : String
    private let destination : String
    private let time_distance : Float
}
