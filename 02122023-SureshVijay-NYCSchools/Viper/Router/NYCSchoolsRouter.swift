//
//  NYCSchoolsRouter.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import UIKit

/// 
/// Handles navigations in the app
///

protocol Navigatable {
    func show(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
}

protocol NYCSchoolsRouting {
    func pushToDetails(nycSchool: NYCSchool)
    func pop()
}

struct NYCSchoolsRouter {
    private let navigation: Navigatable
    
    init(with navigation: Navigatable) {
        self.navigation = navigation
    }
}

extension NYCSchoolsRouter: NYCSchoolsRouting {
    func pushToDetails(nycSchool: NYCSchool) {
        let builder = NYCSchoolsViewBuilder(routing: self)
        guard let detailController = builder.buildSchoolDetailsView(nycSchool: nycSchool) else {
            return
        }
        navigation.show(detailController, animated: true)
    }
    
    func pop() {
        navigation.pop(animated: true)
    }
}
