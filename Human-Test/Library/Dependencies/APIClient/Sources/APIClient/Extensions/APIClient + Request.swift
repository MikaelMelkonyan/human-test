//
//  APIClient + Request.swift
//  APIClient
//
//  Created by Mikael Melkonyan on 10/14/24.
//

import Foundation

extension APIClient {
    func request(
        url urlString: String,
        method: HTTPMethod,
        headers: HTTPHeaders? = nil,
        parameters: [String: Any]? = nil
    ) -> URLRequest {
        let url = URL(string: urlString)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        if let parameters = parameters {
            request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        }
        return request
    }
}
