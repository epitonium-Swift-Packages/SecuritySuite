//
//  SecuritySuite.swift
//  SecuritySuite
//
//  Created by Vitalis Girsas on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import UIKit
// ...........
final public class SecuritySuite {
    //  MARK: - DEFAULT VALUES
    // ///////////////////////////////////////////
    internal struct DefaultValues {
        static var state: SetupState = .disabled
    }
    
    //  MARK: - SETUPS
    // ///////////////////////////////////////////
    public static func setup(_ setupState: SetupState) {
        // Set values
        DefaultValues.state = setupState
    }
    
    //  MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////
    public static func checkSecurityIssues() -> SecuritySuiteCheckResult {
        // Handle state
        switch DefaultValues.state {
        case .disabled:
            return .succes
        // ...........
        case .enabled(let isJailBrokenCheckEnabled,
                      let isDebuggerCheckEnabled,
                      let isEmulatorCheckEnabled,
                      let isReverseEngineeringCheckEnabled,
                      _):
            // Check Jailbroken
            if isJailBrokenCheckEnabled {
                guard !MainMethods.amIJailbroken() else {
                    return .failure(.jailBroken)
                }
            }
            // Check Debugger
            if isDebuggerCheckEnabled {
                guard !MainMethods.amIDebugged() else {
                    return .failure(.debugger)
                }
            }
            // Check Emulator
            if isEmulatorCheckEnabled {
                guard !MainMethods.amIRunInEmulator() else {
                    return .failure(.emulator)
                }
            }
            // Check Reverse Engineering
            if isReverseEngineeringCheckEnabled {
                guard !MainMethods.amIReverseEngineered() else {
                    return .failure(.reverseEngineering)
                }
            }
            return .succes
        }
    }
    
    //                                      MARK: - STRUCTURE
    //..............................................................................................
    public enum SetupState {
        case disabled
        case enabled(isJailBrokenCheckEnabled: Bool,
                     isDebuggerCheckEnabled: Bool,
                     isEmulatorCheckEnabled: Bool,
                     isReverseEngineeringCheckEnabled: Bool,
                     log: LogType = .default)
    }
    // ...........
    public enum SecuritySuiteCheckResult {
        case succes
        case failure(SecuritySuiteError)
    }
    // ...........
    public enum SecuritySuiteError {
        case jailBroken
        case debugger
        case emulator
        case reverseEngineering
    }
}
