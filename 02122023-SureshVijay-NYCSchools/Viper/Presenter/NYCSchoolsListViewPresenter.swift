//
//  NYCSchoolsListViewPresenter.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import Foundation

protocol NYCSchoolsListViewPresenting {
    func fetchSchoolLists(completion:  @escaping (NYCSchoolList?) -> ())
    func didSelect(index: IndexPath)
    var nycSchoolList: NYCSchoolList? { get }
}

final class NYCSchoolsListViewPresenter {
    var nycSchoolList: NYCSchoolList? {
        didSet {
            view?.loadData()
        }
    }
    
    private weak var view: NYCSchoolsListViewing?
    private let routing: NYCSchoolsRouting
    private let interacting: NYCSchoolsListInteracting
    
    init(
        view: NYCSchoolsListViewing?,
        routing: NYCSchoolsRouting,
        interacting: NYCSchoolsListInteracting
    ) {
        self.view =  view
        self.interacting = interacting
        self.routing = routing
        fetchSchoolLists { [weak self] nycSchoolList in
            self?.nycSchoolList = nycSchoolList
        }
    }
}

///MARK:- NYCSchoolsListViewPresenting Methods
extension NYCSchoolsListViewPresenter: NYCSchoolsListViewPresenting {
    func fetchSchoolLists(completion: @escaping (NYCSchoolList?) -> ()) {
        view?.showLoading()
        interacting.schoolLists { [weak self] nycSchoolList in
            completion(nycSchoolList)
            self?.view?.hideLoading()
        }
    }
    
    func didSelect(index: IndexPath) {
        guard let nycSchoolList = nycSchoolList else {
            return
        }
        let nycSchool = nycSchoolList[index.row]
        routing.pushToDetails(nycSchool: nycSchool)
    }
}
 
