//
//  EmulatorChecker.swift
//  SecuritySuite
//
//  Created by Vitalis Girsas on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
// ...........
internal class EmulatorChecker {
    //  MARK: - METHODS 🔄 INTERNAL
    // ///////////////////////////////////////////
    internal static func amIRunInEmulator() -> Bool {
        checkCompile() || checkRuntime()
    }
    
    //  MARK: - METHODS 🔰 PRIVATE
    // ///////////////////////////////////////////
    private static func checkRuntime() -> Bool {
        ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    // ...........
    private static func checkCompile() -> Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
}
