//
//  NetworkProtocol.swift
//  GeneralNetwotkLayeriOS
//
//  Created by Vikash Anand on 15/08/20.
//

protocol ServiceProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: Headers? { get }
    var parameterEncoding: ParameterEncoding { get }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

typealias Parameters = [String: Any]
enum Task {
    case requestPlain
    case requestParameters(Parameters)
}

enum ParametersEncoding {
    case url
    case json
}


