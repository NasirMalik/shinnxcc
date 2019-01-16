//
//  ReviewsTableViewModelTests.swift
//  ShinnxCCTests
//
//  Created by Nasir Mahmood on 15.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import XCTest
@testable import ShinnxCC
///
/// Integration Tests
/// Testing ViewModel & Decoding (Json->Obj) Together, via Mock API Service
///
class ReviewsTableViewModelTests: XCTestCase {
    var viewModel: ReviewsListViewModel!
    var apiService: MockAPIService!
    var delegate: ReviewListModelDelegate!
    
    override func setUp() {
        apiService = MockAPIService()
        viewModel = ReviewsListViewModelImpl(withDelegate: nil, apiService: apiService)
    }
    
    func testFetchReviewsSuccess() {
        
        //GIVEN
        let exp = expectation(description: "Review fetched successfully")
        
        //WHEN
        viewModel.fetchReviews(refresh: false)
        
        //THEN
        let result = XCTWaiter.wait(for: [exp], timeout: 0.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(viewModel.reviews.count, 1)
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testDecodeReviewsShouldEmitValues() {
        
        //GIVEN
        let exp = expectation(description: "Test Values Decoded Successfully")
        
        //WHEN
        viewModel.fetchReviews(refresh: false)
        
        //THEN
        let review = viewModel.reviews[0]
        let result = XCTWaiter.wait(for: [exp], timeout: 0.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(review.id, 4763613, "Review decoded successfully")
        } else {
            XCTFail("Delay interrupted")
        }
        
    }
    
    func testFetchReviewsFailedGracefully() {
        
     //GIVEN
        let exp = expectation(description: "Fetch failed gracefully")
        apiService.forceFailure = true

        //WHEN
        viewModel.fetchReviews(refresh: false)
        
        //THEN
        let result = XCTWaiter.wait(for: [exp], timeout: 0.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(viewModel.reviews.count, 0)
        } else {
            XCTFail("Delay interrupted")
        }
    
    }

    func testFetchOfAPIShouldbeCalledOnce() {
        
        let exp = expectation(description: "No Duplicate Calls")
        
        //WHEN
        _ =  viewModel.fetchReviews(refresh: false)
        let result = XCTWaiter.wait(for: [exp], timeout: 0.1)
        if result == XCTWaiter.Result.timedOut {
            XCTAssertEqual(apiService.numberOfTimesfetchReviews, 1)
        } else {
            XCTFail("Delay interrupted")
        }
    }

}
