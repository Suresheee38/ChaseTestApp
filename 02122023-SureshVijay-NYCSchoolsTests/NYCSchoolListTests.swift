//
//  NYCSchoolListTests.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import XCTest
@testable import _2122023_SureshVijay_NYCSchools

final class NYCSchoolListTests: XCTestCase {

    var presenter: NYCSchoolsListViewPresenter!
    var router: MockRouter!
    var interactor: MockListViewInteractor!
    var view: MockListView!
    
    override func setUpWithError() throws {
        router = MockRouter()
        interactor = MockListViewInteractor()
        view = MockListView()
        presenter = NYCSchoolsListViewPresenter(
            view: view,
            routing: router,
            interacting: interactor
        )
    }
    
    func testToFetchSchoolLists() {
        // when
        presenter.fetchSchoolLists { _ in }
        
        //then
        guard case .schoolLists(let school) = interactor.calledMethods.first else {
            XCTFail("Not details are fetched")
            return
        }
        XCTAssert(view.calledMethods.last == .hideLoading)
        XCTAssert(school.dbn?.isEmpty == false, "Dbn value is empty")
    }
    
    func testDidSelect() {
        // when
        presenter.didSelect(index: IndexPath(row: 0, section: 0))
        
        //then
        guard case .pushToDetails = router.calledMethods.first else {
            XCTFail("Not pushed")
            return
        }
        XCTAssert(router.calledMethods.first == .pushToDetails)
    }
}
