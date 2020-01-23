//
//  SecuritySuite.swift
//  SecuritySuite
//
//  Created by Vitalis on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import UIKit

// ...........

final public class SecuritySuite {
    
    //                                      MARK: - CONTROLS
    //..............................................................................................
    
    // MARK: Default values
    
    private struct DefaultValues {
        
        static var isJailBrokenCheckEnabled         = true
        static var isDebuggerCheckEnabled           = true
        static var isEmulatorCheckEnabled           = true
        static var isReverseEngineeringCheckEnabled = true
    }
    
    //                                      MARK: - STRUCTURE
    //..............................................................................................
    
    public enum SecError {
        
        case jailBroken
        case debugger
        case emulator
        case reverseEngineering
    }
    
    // ...........
    
    public enum SecuritySuiteCheckResult {

        case succes
        case failure(SecError)
    }
    
    //  MARK: - SETUPS
    // ///////////////////////////////////////////
    
    public static func setup(isJailBrokenCheckEnabled: Bool,
                             isDebuggerCheckEnabled: Bool,
                             isEmulatorCheckEnabled: Bool,
                             isReverseEngineeringCheckEnabled: Bool) {

        DefaultValues.isJailBrokenCheckEnabled         = isJailBrokenCheckEnabled
        DefaultValues.isDebuggerCheckEnabled           = isDebuggerCheckEnabled
        DefaultValues.isEmulatorCheckEnabled           = isEmulatorCheckEnabled
        DefaultValues.isReverseEngineeringCheckEnabled = isReverseEngineeringCheckEnabled
    }
    
    //  MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////
    
    public static func checkSecurityIssues() -> SecuritySuiteCheckResult {

        // Check Jailbroken
        
        if DefaultValues.isJailBrokenCheckEnabled {
            guard !MainMethods.amIJailbroken() else {
                return .failure(.jailBroken)
            }
        }
        
        // Check Debugger
        
        if DefaultValues.isDebuggerCheckEnabled {
            guard !MainMethods.amIDebugged() else {
                return .failure(.debugger)
            }
        }
        
        // Check Emulator
        
        if DefaultValues.isEmulatorCheckEnabled {
            guard !MainMethods.amIRunInEmulator() else {
                return .failure(.emulator)
            }
        }
        
        // Check Reverse Engineering
        
        if DefaultValues.isReverseEngineeringCheckEnabled {
            guard !MainMethods.amIReverseEngineered() else {
                return .failure(.reverseEngineering)
            }
        }
        
        return .succes
    }
}
