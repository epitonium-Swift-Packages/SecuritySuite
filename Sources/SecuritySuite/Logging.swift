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
    func verbose(mesage: String)
    func debug(mesage: String)
    func info(mesage: String)
    func warning(mesage: String)
    func error(mesage: String)
}
// ...........
internal class Logger {
    //  MARK: - INITS
    // ////////////////////////////////////
    private init() {
        // ✔️ NONE
    }
    
    // MARK: - PROPERTIES 🔰 PRIVATE
    // ////////////////////////////////////
    private(set) static var logAdapter: SecuritySuiteLogAdapter?
    
    //  MARK: - METHODS 🔄 INTERNAL
    // ///////////////////////////////////////////
    internal static func set(adapter: SecuritySuiteLogAdapter) {
        logAdapter = adapter
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
