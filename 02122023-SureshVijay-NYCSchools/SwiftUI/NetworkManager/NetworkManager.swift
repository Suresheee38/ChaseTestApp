//
//  NetworkManager.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/14/23.
//

import Foundation
typealias NYCSchoolDetailResultType = Result<NYCSchoolDetails, Error>
typealias NYCSchoolDetailAPICompletionType = (NYCSchoolDetailResultType) -> ()

protocol NetworkManaging {
    init(apiExecutor: APIExecutable)
    func fetchDetail(dbn: String, completion: @escaping NYCSchoolDetailAPICompletionType)
}

///Network manager to execute API request
struct NetworkManager: NetworkManaging {
    private let apiExecutor: APIExecutable
    
    init(apiExecutor: APIExecutable) {
        self.apiExecutor = apiExecutor
    }
    
    func fetchDetail(
        dbn: String,
        completion: @escaping NYCSchoolDetailAPICompletionType
    ) {
        let jsonRequest = JSONURLRequest(
            queryParams: ["dbn": dbn],
            urlPath: .getDetailForSchool,
            completion: completion
        )
        apiExecutor.execute(request: jsonRequest)
    }
}
