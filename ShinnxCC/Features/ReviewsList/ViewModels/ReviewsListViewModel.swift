//
//  ReviewsListViewModel.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import Foundation

protocol ReviewsListViewModel {
    var reviews: [Review] {get}
    var shouldShowLoadingCell : Bool {get}
    
    //Paginated Fetching
    func fetchNextPage()
    func fetchReviews(refresh: Bool)
    func isLoadingIndexPath(indexPath: IndexPath) -> Bool

}

protocol ReviewListModelDelegate {
    func reloadDataAfterSuccessfulFetch()
    func displayErrorAfterFetchFailure(error : Error?)
}

class ReviewsListViewModelImpl: ReviewsListViewModel {
    
    private var delegate : ReviewListModelDelegate?
    
    // injected
    var apiService: APIService!
    
    fileprivate var currPage = 1
    fileprivate let perPage = 10
    var shouldShowLoadingCell = false
    
    var reviews = [Review]()
    
    init(withDelegate del: ReviewListModelDelegate?, apiService : APIService?) {
        if let delegateLoc = del {
            self.delegate = delegateLoc
        }
        if let apiServiceLoc = apiService {
            self.apiService = apiServiceLoc
        }
    }
    
    fileprivate func fetchReviews(page: Int, perPage: Int, direction : Direction, refresh: Bool) {
        apiService.fetchReviews(page:page, perPage: perPage, direction : direction,
                                onSuccess: { reviewResultObj in
                                        if refresh {
                                            self.reviews = reviewResultObj.reviews
                                        } else {
                                            self.reviews.append(contentsOf:reviewResultObj.reviews)
                                        }
                                        self.shouldShowLoadingCell = self.currPage < (reviewResultObj.totalReviewsComments/self.perPage)
                                        self.delegate?.reloadDataAfterSuccessfulFetch()
                                    
        }, onFailure: {[weak self] error in
            self?.delegate?.displayErrorAfterFetchFailure(error: error)
        })
        
    }
}
//Mark: Pagination
extension ReviewsListViewModelImpl {
    func fetchNextPage() {
        currPage += 1
        fetchReviews()
    }
    
    func fetchReviews(refresh: Bool = false) {
        if refresh == true { currPage = 1 }
        fetchReviews(page: currPage, perPage:perPage, direction: Direction.decending, refresh: refresh)
    }
    
    func isLoadingIndexPath(indexPath: IndexPath) -> Bool {
        guard shouldShowLoadingCell else { return false }
        return indexPath.row == self.reviews.count
    }
    
    
}
