//
//  MainViewModel.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/27.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel {
    
    private var mainSource = BehaviorSubject<MainViewSource>(value: MainViewSource())
    private let mainUseCase = MainViewUseCase()
    private let disposeBag = DisposeBag()
    private var randomIndex: Int!
    
    init() {
        fetchMainSource()
    }
    
    private func fetchMainSource() {
        mainUseCase.get()
            .bind(to: mainSource)
            .disposed(by: disposeBag)
    }
    
    lazy private var herobanners = mainSource.map({
        $0.heroBanners
    })
    
    lazy private var heroSectionCount = herobanners.subscribe(onNext: {
        self.randomIndex = Int.random(in: 0..<$0.count)
    }).disposed(by: disposeBag)
    
    lazy var mainHeroSection = herobanners.element(at: randomIndex)
    
    lazy var anotherHeroSection = herobanners.enumerated()
        .map({
            $0.index != self.randomIndex
        })
    
    lazy var nearDestination = mainSource.map({
        $0.nearDestinations
    })
}
