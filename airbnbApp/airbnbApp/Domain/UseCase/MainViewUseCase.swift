//
//  MainViewUseCase.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/27.
//

import Foundation
import RxSwift

class MainViewUseCase {
    
    func get() -> Observable<MainViewSource> {
        return NetworkService.shared.getMain()
    }
}
