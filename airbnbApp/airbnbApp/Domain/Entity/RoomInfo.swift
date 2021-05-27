//
//  RoomInfo.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/24.
//

import Foundation

struct RoomInfo: Codable {
    let roomId : Int
    let roomName : String
    let images : [String]
    let grade : Float // 실수형
    let reviewer : Int
    let location : String
    let pricePerDay : Int
    let totalPrice : Int// iOS가 계산.
    let roomType :String // "레지던스 전체", "아파트 전체", "게스트용 별채 전체" "초소형 주택" "개인실"
    let roomConfiguration: String // "최대인원 3명∙원룸∙침대 1개∙욕실 1개"
    let description : String
    let host: Host
}

struct Host: Codable {
    let name : String
    let profileImage : String
}
