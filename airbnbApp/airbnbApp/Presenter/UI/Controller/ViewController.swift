//
//  ViewController.swift
//  airbnbApp
//
//  Created by 이다훈 on 2021/05/20.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class ViewController: UIViewController {

    @IBOutlet weak var mainHeroImage: UIImageView!
    
    let viewModel = MainViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func bind() {
        viewModel.mainHeroSection
            .map({$0.first?.image})
            .observe(on: MainScheduler.instance)
            .bind(to: mainHeroImage.rx.image)
            
    }
    
    /*
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
        let reservationConfition = ReservationConditions.init(location: "seoul", checkIn: "2020-05-20", checkOut: "2020-05-30", minPrice: 10000, maxPrice: 10000000, personnel: 1)
        networkService.getSearch(conditions: reservationConfition)
            .subscribe(
                onNext: { data in
                    print("ArrayCount: \(data.first?.location)")
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
        let reservationConfition = ReservationConditions.init(location: "seoul", checkIn: "2020-05-20", checkOut: "2020-05-30", minPrice: 10000, maxPrice: 10000000, personnel: 1)
        networkService.getRoomPrice(conditions: reservationConfition)
            .subscribe(
                onNext: { data in
                    print("cleaningFee: \(data.cleaningFee)")
                    print("discountPerWeek: \(data.discountPerWeek)")
                    print("serviceFee: \(data.serviceFee)")
                    print("tax: \(data.tax)")
                    print("tax: \(data.totalPrice)")
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
 */
}

