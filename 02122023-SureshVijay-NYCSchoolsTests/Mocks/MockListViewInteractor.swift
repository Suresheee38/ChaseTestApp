//
//  MockListViewInteractor.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

@testable import _2122023_SureshVijay_NYCSchools

class MockListViewInteractor: NYCSchoolsListInteracting {
    func schoolLists(completion: @escaping (NYCSchoolList?) -> ()) {
        calledMethods.append(.schoolLists(mockSchool))
        completion([mockSchool])
    }
    
    enum Methods {
        case schoolLists(NYCSchool)
    }
    var calledMethods: [Methods] = []
}
