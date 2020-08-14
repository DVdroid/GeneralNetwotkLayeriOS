//
//  Task.swift
//  GeneralNetwotkLayeriOS
//
//  Created by Vikash Anand on 15/08/20.
//

public typealias Parameters = [String: Any]
public enum Task {
    case requestPlain
    case requestParameters(Parameters)
}
