//
//  NYCSchoolsAppRepository.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//

import Foundation
import UIKit

typealias Parameters = [String: Any]

typealias NYCSchoolResultType = Result<NYCSchoolList?, Error>
typealias NYCSchoolAPICompletionType = (NYCSchoolResultType) -> ()

protocol NYCSchoolsAppRepositoryCallable {
    func fetchSchoolList(completion: @escaping NYCSchoolAPICompletionType)
}

/// URL configuration
enum URLPath {
    case getList
    case getDetailForSchool
    
    var path: String {
        let basePath = "https://data.cityofnewyork.us/resource"
        switch self {
        case .getList:
            return basePath + "/s3k6-pzi2.json"
        case .getDetailForSchool:
            return basePath + "/f9bf-2cp4.json"
        }
    }
}

///https://data.cityofnewyork.us/Education/resource/s3k6-pzi2.json
///https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=21K728
///
/// NYCSchoolsAppRepository - Common repository for the App
/// All service calls interface declared and implemented here
///

class NYCSchoolsAppRepository {
    var apiExecuter: APIExecutable
    
    init(apiExecuter: APIExecutable) {
        self.apiExecuter = apiExecuter
    }
}

///MARK:- NYCSchoolsAppRepository Methods
extension NYCSchoolsAppRepository: NYCSchoolsAppRepositoryCallable {
    
    func fetchSchoolList(
        completion: @escaping NYCSchoolAPICompletionType
    ) {
        let jsonRequest = JSONURLRequest(
            urlPath: .getList,
            completion: completion
        )
        apiExecuter.execute(request: jsonRequest)
    }
}
