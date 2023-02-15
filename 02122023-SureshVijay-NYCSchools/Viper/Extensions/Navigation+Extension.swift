//
//  Navigation+Extension.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import UIKit

extension UINavigationController: Navigatable {
    func pop(animated: Bool) {
        popViewController(animated: animated)
    }
    
    func show(_ viewController: UIViewController, animated: Bool) {
        pushViewController(viewController, animated: true)
    }
}
