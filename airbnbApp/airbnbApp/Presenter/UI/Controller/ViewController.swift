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
//        getMainTest() // Test Success
//        getSearchPriceResultTest() // Test Success
//        getSearchTest() // Body
//        getRoomTest() // Test Success
//        getRoomPriceTest() // Body
//        getBookingsTest() // Test Success
//        getBookingTest() // Test Success
//        getWishlistTest() // Fatal error: The operation couldn’t be completed
    }
    
    func getMainTest() {
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
    
    func getSearchPriceResultTest() {
        networkService.getSearchPriceResult()
            .subscribe(
                onNext: { data in
                    print("ArrayCount: \(data.count)")
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

    func getSearchTest() {
        networkService.getSearch()
            .subscribe(
                onNext: { data in
                    print("ArrayCount: \(data.location)")
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
    
    func getRoomTest() {
        networkService.getRoom()
            .subscribe(
                onNext: { data in
                    print("Grade: \(data.grade)")
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
    
    func getRoomPriceTest() {
        networkService.getRoomPrice()
            .subscribe(
                onNext: { data in
                    print("ArrayCount: \(data.location)")
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

    func getBookingsTest() {
        networkService.getBookings()
            .subscribe(
                onNext: { data in
                    print("Booking Count: \(data.count)")
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
    
    func getBookingTest() {
        networkService.getBooking()
            .subscribe(
                onNext: { data in
                    print("Booking Guest: \(data.guest)")
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
    
    func getWishlistTest() {
        networkService.getWishlist()
            .subscribe(
                onNext: { data in
                    print("Wishlist Count: \(data.count)")
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

