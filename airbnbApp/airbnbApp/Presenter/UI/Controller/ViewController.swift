//
//  ViewController.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/20.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    let networkService = NetworkService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkService.getMain()
            .subscribe(
                onNext: { data in
                    print("banner: \(data.hero_banners)")
                    print("destination: \(data.near_destinations)")
                },
                onError: { error in
                    print("onError: \(error)")
                },
                onCompleted: {
                    print("onCompleted")
                }
            )
            .disposed(by: disposeBag)
    }


}

