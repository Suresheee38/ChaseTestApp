//
//  MockApiExecutor.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import Foundation
@testable import _2122023_SureshVijay_NYCSchools

class MockApiExecutor: APIExecutable {
    var calledMethods: [Methods] = []
    enum Methods {
        case execute
    }
    
    func execute(request: URLRequestable) {
        calledMethods.append(.execute)
    }
}
