//
//  RoomInfo.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/24.
//

import Foundation

struct RoomInfo: Codable {
    let roomid : Int
    let image : [String]
    let grade : Float // 실수형
    let howManyReviewer : Int
    let location : String
    let roomName : String
    let pricePerDay : Int
    let totalPrice : Int// iOS가 계산.
    let roomType :String // "레지던스 전체", "아파트 전체", "게스트용 별채 전체" "초소형 주택" "개인실"
    let host: Host
    let roomConfiguration: String // "최대인원 3명∙원룸∙침대 1개∙욕실 1개"
    let description : String
}

struct Host{
    let name : String
    let profileImage : String
}
