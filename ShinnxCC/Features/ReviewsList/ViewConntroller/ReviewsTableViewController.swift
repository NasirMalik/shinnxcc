//
//  ViewController.swift
//  ShinnxCC
//
//  Created by Nasir Mahmood on 14.01.19.
//  Copyright © 2019 shinnxstudios. All rights reserved.
//

import UIKit

protocol ReviewTableViewActions {
    var onRightBarButtonTap:((UIBarButtonItem)->Void)? {get set}
}

class ReviewsTableViewController: UIViewController, ReviewTableViewActions {
    var onRightBarButtonTap: ((UIBarButtonItem) -> Void)?
    @IBOutlet weak var tableView: UITableView!
    
    //Injected
    var viewModel: ReviewsListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        title = "Reviews"
        tableView.register(ReviewTableViewCell.self)
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refreshReviews), for: .valueChanged)
        tableView.refreshControl?.beginRefreshing()
        
        if let closure = onRightBarButtonTap {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "＋", style: .plain, closure: closure)
        }
        
        viewModel.fetchReviews(refresh: false)
    }
    
    @objc private func refreshReviews(){
        tableView.refreshControl?.beginRefreshing()
        viewModel.fetchReviews(refresh: true)
    }
    
    func showError(_ error: Error) {
        // TODO: Error Dilagoue can be an extension of UIAlertController
        let alert = UIAlertController(title: "Error", message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Retry", style: .default, handler: { _ in
            self.tableView.refreshControl?.beginRefreshing()
            self.viewModel.fetchReviews(refresh: false)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension ReviewsTableViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel.reviews.count
        return viewModel.shouldShowLoadingCell ? count + 1 : count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if viewModel.isLoadingIndexPath(indexPath: indexPath) {
            return LoadingTableViewCell(style: .default, reuseIdentifier: LoadingTableViewCell.defaultReuseIdentifier)
        } else {
            let cell: ReviewTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(self.viewModel.reviews[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if viewModel.isLoadingIndexPath(indexPath: indexPath){
            return 44.0
        } else {
            return UITableView.automaticDimension
        }
    }
}

extension ReviewsTableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard viewModel.isLoadingIndexPath(indexPath: indexPath) else { return }
        viewModel.fetchNextPage()
    }
}

// IdentifiableViewController to load using 'UIStoryboard'
extension ReviewsTableViewController: IdentifiableViewController {}

extension ReviewsTableViewController : ReviewListModelDelegate {
    func reloadDataAfterSuccessfulFetch(){
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    func displayErrorAfterFetchFailure(error: Error?){
        if let err = error {
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
            }
            self.showError(err)
        }
    }
}
