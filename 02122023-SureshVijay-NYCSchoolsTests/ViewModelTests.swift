//
//  ViewModelTests.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import XCTest
@testable import _2122023_SureshVijay_NYCSchools


var mockSchool = NYCSchool(dbn: "1234", schoolName: "MySchool", boro: "", overview_paragraph: "", academicopportunities1: "", academicopportunities2: "", ell_programs: "", neighborhood: "", building_code: "", location: "", phone_number: "", fax_number: "", school_email: "", website: "", subway: "", bus: "", grades2018: "", finalgrades: "", total_students: "", extracurricular_activities: "", school_sports: "", attendance_rate: "", pct_stu_enough_variety: "", pct_stu_safe: "", school_accessibility_description: "", directions1: "", requirement1_1: "", requirement2_1: "", requirement3_1: "", requirement4_1: "", requirement5_1: "", offer_rate1: "", program1: "", code1: "", interest1: "", method1: "", seats9ge1: "", grade9gefilledflag1: "", grade9geapplicants1: "", seats9swd1: "", grade9swdfilledflag1: "", grade9swdapplicants1: "", seats101: "", admissionspriority11: "", admissionspriority21: "", admissionspriority31: "", grade9geapplicantsperseat1: "", grade9swdapplicantsperseat1: "", primary_address_line_1: "", city: "", zip: "", state_code: "", latitude: "", longitude: "", community_board: "", council_district: "", census_tract: "", bin: "", bbl: "", nta: "", borough: "")

var detail = NYCSchoolDetail(dbn: "1234", schoolName: "", numOfSatTestTakers: "", satCriticalReadingAvgScore: "", satMathAvgScore: "", satWritingAvgScore: "")


final class ViewModelTests: XCTestCase {
    var viewModel: NYCSchoolDetailViewModeling!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = NYCSchoolDetailViewModel(nycShcool: mockSchool, networkManaging: MockNetworkManager(apiExecutor: MockApiExecutor()))
    }
    
    func testFetchSchoolDetail() {
        //when
        
        viewModel.fetchDetail(for: "1234") { _ in }
        
        //then
       XCTAssert(viewModel.getDetailData(for: .sat)?.keyAndValues.isEmpty == false, "No sat score info present")
       XCTAssert(viewModel.getDetailData(for: .sat)?.title == "Sat Scores", "title is not valid")
        
        XCTAssert(viewModel.getDetailData(for: .schoolInfo)?.keyAndValues.isEmpty == false, "No school info present")
        XCTAssert(viewModel.getDetailData(for: .schoolInfo)?.title == "School Info", "title is not valid")
    }
}
