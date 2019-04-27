//
//  Constants.swift
//  Contact
//
//  Created by Damodar, Namala (623-Extern) on 26/04/19.
//  Copyright © 2019 Damodar, Namala (623-Extern). All rights reserved.
//

import Foundation


// API Headers
enum HTTPHeader {
    case contentType(String)
    var header: (field: String, value: String) {
        switch self {
            case .contentType(let value): return (field: "Content-Type", value: value)
        }
    }
}

// HTTP Method
enum HTTPMethods: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

// API Endpoint
protocol URLEndPoint {
    var base:  String { get }
    var path: String { get }
}

// constructing url with components
extension URLEndPoint {
    var components: URLComponents? {
    guard var components = URLComponents(string: base) else { return nil }
    components.path = path
    return components
    }

    // constructing url with components
    var request: URLRequest? {
        guard let url = components?.url ?? URL(string: "\(self.base)\(self.path)") else { return nil }
        let request = URLRequest(url: url)
        return request
    }


    
    // constructing post method body from header enum
    func postRequest<T: Encodable>(parameters: T, headers: [HTTPHeader]) -> URLRequest? {
        guard var request = self.request else { return nil }
        request.httpMethod = HTTPMethods.post.rawValue
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
        } catch {
            return nil
        }
        headers.forEach { request.addValue($0.header.value, forHTTPHeaderField: $0.header.field) }
        return request
    }
}

// extra methonds added
extension URLEndPoint {
    func requestWith(id: Int) -> URLRequest {
        let path: String =  self.path.replacingOccurrences(of: "{}", with: String(id))
        let url =  URL(string: (self.base + path))
        let request = URLRequest(url: url!)
        return request
    }
    
    func from(path : String) -> URLRequest {
        let url =  URL(string: (self.base + path))
        let request = URLRequest(url: url!)
        return request
    }

}
