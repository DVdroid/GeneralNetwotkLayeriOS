//
//  NetworkError.swift
//  GeneralNetwotkLayeriOS
//
//  Created by Vikash Anand on 15/08/20.
//

import Foundation

public enum NetworkError: LocalizedError {
    case unknown(withDescription: String)
    case noJSONData(withDescription: String)

    var localizedDescription: String {
        switch self {
        case .unknown(withDescription: let description):
            return NSLocalizedString(description, comment: "")
        case .noJSONData(withDescription: let description):
            return NSLocalizedString(description, comment: "")
        }
    }
}
