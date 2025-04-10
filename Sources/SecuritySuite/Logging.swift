//
//  Logging.swift
//  SecuritySuite
//
//  Created by Vitalis Girsas on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
// ...........
public protocol SecuritySuiteLogAdapter {
    func info(mesage: String)
    func warning(mesage: String)
}
// ...........
public enum LogType {
    case disabled
    case `default`
    case custom(SecuritySuiteLogAdapter)
}
// ...........
internal var Log: SecuritySuiteLogAdapter? {
    // Get log
    guard case (.enabled(_,_,_,_, let log)) = SecuritySuite.DefaultValues.state else {
        return nil
    }
    // Handle log
    switch log {
    case .disabled:
        return nil
    // ...........
    case .default:
        return DefaultLogAdapter()
    // ...........
    case .custom(let adapter):
        return adapter
    }
}
// ...........
internal struct DefaultLogAdapter: SecuritySuiteLogAdapter {
    // MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////
    func verbose(mesage: String) {
        print(mesage)
    }
    // ...........
    func debug(mesage: String) {
        print(mesage)
    }
    // ...........
    func info(mesage: String) {
        print(mesage)
    }
    // ...........
    func warning(mesage: String) {
        print(mesage)
    }
    // ...........
    func error(mesage: String) {
        print(mesage)
    }
}
