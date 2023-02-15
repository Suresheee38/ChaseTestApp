//
//  NYCSchoolsListInteractor.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import Foundation
typealias NYCSchoolListCompletion = (NYCSchoolList?) -> ()

protocol NYCSchoolsListInteracting {
    func schoolLists(completion:  @escaping NYCSchoolListCompletion)
}

struct NYCSchoolsListInteractor: NYCSchoolsListInteracting {
    private let services: NYCSchoolsAppRepositoryCallable
    
    init(services: NYCSchoolsAppRepositoryCallable) {
        self.services = services
    }
    
    //fetch school lists
    func schoolLists(completion: @escaping NYCSchoolListCompletion) {
        services.fetchSchoolList { nycSchool in
            let school = try? nycSchool.get()
            completion(school)
        }
    }
}
