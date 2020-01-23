//
//  EmulatorChecker.swift
//  SecuritySuite
//
//  Created by Vitalis on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
// ...........

internal class EmulatorChecker {
    
    //  MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////
    
    static func amIRunInEmulator() -> Bool {
        return checkCompile() || checkRuntime()
    }
    
    //  MARK: - METHODS 🔰 PRIVATE
    // ///////////////////////////////////////////
    
    private static func checkRuntime() -> Bool {
        return ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
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
