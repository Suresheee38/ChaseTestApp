//
//  MockRouter.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//


@testable import _2122023_SureshVijay_NYCSchools

class MockRouter: NYCSchoolsRouting {
    enum Methods {
        case pushToDetails
        case pop
    }
    
    var calledMethods: [Methods] = []
    
    func pushToDetails(nycSchool: NYCSchool) {
        calledMethods.append(.pushToDetails)
    }
    
    func pop() {
        calledMethods.append(.pop)
    }
}
