//
//  MockListView.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

@testable import _2122023_SureshVijay_NYCSchools

class MockListView: NYCSchoolsListViewing {
    enum Methods {
        case loadData
        case showLoading
        case hideLoading
    }
    
    var calledMethods: [Methods] = []
    
    func loadData() {
        calledMethods.append(.loadData)
    }
    
    func showLoading() {
        calledMethods.append(.showLoading)
    }
    
    func hideLoading() {
        calledMethods.append(.hideLoading)
    }
}
