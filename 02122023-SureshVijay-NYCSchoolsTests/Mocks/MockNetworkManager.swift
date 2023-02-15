//
//  MockNetworkManager.swift
//  02122023-SureshVijay-NYCSchoolsTests
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import Foundation
@testable import _2122023_SureshVijay_NYCSchools

class MockNetworkManager: NetworkManaging {
    private let apiExecutor: APIExecutable
    
    required init(apiExecutor: APIExecutable) {
        self.apiExecutor = apiExecutor
    }
    
    func fetchDetail(
        dbn: String,
        completion: @escaping NYCSchoolDetailAPICompletionType
    ) {
        completion(Result.success([detail]))
        calledMethods.append(.fetchDetail)
    }
    
    enum Methods {
        case fetchDetail
    }
    
    var calledMethods: [Methods] = []
}
