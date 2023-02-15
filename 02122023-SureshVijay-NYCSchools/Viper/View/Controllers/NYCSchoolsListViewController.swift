//
//  NYCSchoolsListViewController.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import UIKit

protocol NYCSchoolsListViewing: AnyObject {
    func loadData()
    func showLoading()
    func hideLoading()
}

class NYCSchoolsListViewController: UIViewController {
    @IBOutlet private weak var nycSchoolListTableView: UITableView!
    private var activityView =  UIActivityIndicatorView(style: .medium)

    private enum Constant {
        static let cellIdentifier = String(describing: NYCSchoolListTableViewCell.self)
        static let viewTitle = "School Lists"
        static let estimatedRowHeight = 110.0
    }
    
    var presenter: NYCSchoolsListViewPresenting!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constant.viewTitle
        nycSchoolListTableView.register(
            UINib(
                nibName: Constant.cellIdentifier,
                bundle: Bundle.main
            ), forCellReuseIdentifier: Constant.cellIdentifier
        )
        nycSchoolListTableView.estimatedRowHeight = Constant.estimatedRowHeight
        nycSchoolListTableView.rowHeight = UITableView.automaticDimension
    }
}

/// MARK:- UITableViewDelegate & UITableViewDataSource Methods
extension NYCSchoolsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellIdentifier) as? NYCSchoolListTableViewCell else {
            fatalError()
        }
        cell.setUpWithModel(
            nycSchoolList: presenter.nycSchoolList,
            indexpath: indexPath
        )
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {        
        //unselect previous selection
        tableView.deselectRow(
            at: indexPath,
            animated: true
        )
        presenter.didSelect(index: indexPath)
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return presenter.nycSchoolList?.count ?? 0
    }
}

/// MARK:- NYCSchoolsListViewing Methods
extension NYCSchoolsListViewController: NYCSchoolsListViewing {
    func showLoading() {
        activityView.center = self.view.center
        view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func hideLoading() {
        activityView.stopAnimating()
    }
    
    func loadData() {
         nycSchoolListTableView.reloadData()
    }
}
