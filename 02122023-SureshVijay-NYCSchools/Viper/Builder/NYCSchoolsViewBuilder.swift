//
//  NYCSchoolsViewBuilder.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import UIKit
import SwiftUI

protocol NYCSchoolsViewBuilding {
    func buildSchoolListView() -> UIViewController?
    func buildSchoolDetailsView(nycSchool: NYCSchool) -> UIViewController?
}

class NYCSchoolsViewBuilder: NYCSchoolsViewBuilding {
    private let routing: NYCSchoolsRouting
    
    private enum Constants {
        static let nycSchoolsListViewControllerId = "NYCSchoolsListViewController"
        static let nycchoolsDetailsViewControllerId = "NYCSchoolsDetailViewController"
    }
    
    init(routing: NYCSchoolsRouting) {
        self.routing = routing
    }
    
    private lazy var appStoryBoard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: nil)
    }()
    
    /// NYCSchoolsListViewController
    func buildSchoolListView() -> UIViewController? {
        let viewController = appStoryBoard.instantiateViewController(withIdentifier: Constants.nycSchoolsListViewControllerId) as? NYCSchoolsListViewController
        viewController?.presenter = NYCSchoolsListViewPresenter(
            view: viewController,
            routing: routing,
            interacting: NYCSchoolsListInteractor(
                services: NYCSchoolsAppRepository(
                    apiExecuter: APIExecuter()
                )
            )
        )
        return viewController
    }
    
    /// SWIFTUI View
    func buildSchoolDetailsView(nycSchool: NYCSchool) -> UIViewController? {
        let detailSwiftUIView = SchoolListDetailView(viewModel: NYCSchoolDetailViewModel(nycShcool: nycSchool), show: true)
        let detailViewController = UIHostingController(rootView: detailSwiftUIView)
        return detailViewController
    }
}
