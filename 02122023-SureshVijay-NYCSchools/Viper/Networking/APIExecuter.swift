//
//  APIExecuter.swift
//  02122023-SureshVijay-NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/11/23.
//


import Foundation

///
/// APIExecuter - Used to execute requests of type 'URLRequestable'
///

protocol APIExecutable {
    func execute(request: URLRequestable)
}

/// URL Requestable protocol can be implemented by
/// JSON request
/// Image request
/// As of now only JSON request utilized it
protocol URLRequestable {
    var request: URLRequest? { get set }
    func didCompleteRequest(with data: Data?)
}

struct APIExecuter: APIExecutable {
    
    /// Execute URLSession task
    /// Parameters: request of any type implements 'URLRequestable'
    
    func execute(request: URLRequestable) {
        guard let unwrappedRequest = request.request else  {
            return
        }
        let task = URLSession.shared.dataTask(with: unwrappedRequest) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    request.didCompleteRequest(with: data)
                } else if let error = error {
                    print("Request Failed \(error)")
                }
            }
        }
        task.resume()
    }
}
