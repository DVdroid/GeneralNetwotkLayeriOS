//
//  URLSessionProvider.swift
//  GeneralNetwotkLayeriOS
//
//  Created by Vikash Anand on 15/08/20.
//

import Foundation

public final class URLSessionProvider: ProviderProtocol {

    private var session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    public func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (Result<T, NetworkError>) -> ()) where T: Decodable {
        let request = URLRequest(service: service)

        let task = session.dataTask(request: request) { [weak self] (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        }
        task.resume()
    }

    private func handleDataResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (Result<T, NetworkError>) -> ()) {

        guard error == nil else { return completion(.failure(.unknown(withDescription: "")))}
        guard let response = response else { return completion(.failure(.noJSONData(withDescription: "")))}

        switch response.statusCode {
        case 200...299:
            guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else { return completion(.failure(.unknown(withDescription: ""))) }
            completion(.success(model))
        default:
            completion(.failure(.unknown(withDescription: "")))
        }
    }

}
