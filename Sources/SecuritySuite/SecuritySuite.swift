//
//  SecuritySuite.swift
//  SecuritySuite
//
//  Created by Vitalis on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation

// ...........

public class SecuritySuite {
    
    //  MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////
    
    /**
     This type method is used to determine the true/false jailbreak status
     
     Usage example
     ```
     let isDeviceJailbroken = SecuritySuite.amIJailbroken() ? true : false
     ```
     */
    public static func amIJailbroken() -> Bool {
        
        let result = JailbreakChecker.amIJailbroken()
        
        switch result {
        case true:
            print("Jailbrake check: ⛔️")
        case false:
            print("Jailbrake check: ✅")
        }
        
        return result
    }
    
    // ...........
    
    /**
     This type method is used to determine the jailbreak status with a message which jailbreak indicator was detected
     
     Usage example
     ```
     let jailbreakStatus = SecuritySuite.amIJailbrokenWithFailMessage()
     if jailbreakStatus.jailbroken {
     print("This device is jailbroken")
     print("Because: \(jailbreakStatus.failMessage)")
     } else {
     print("This device is not jailbroken")
     }
     ```
     
     - Returns: Tuple with with the jailbreak status *Bool* labeled *jailbroken* and *String* labeled *failMessage*
     to determine check that failed
     */
    public static func amIJailbrokenWithFailMessage() -> (jailbroken: Bool, failMessage: String) {
        return JailbreakChecker.amIJailbrokenWithFailMessage()
    }
    
    // ...........
    
    /**
     This type method is used to determine if application is run in emulator
     
     Usage example
     ```
     let runInEmulator = SecuritySuite.amIRunInEmulator() ? true : false
     ```
     */
    public static func amIRunInEmulator() -> Bool {
        
        let result = EmulatorChecker.amIRunInEmulator()
        
        switch result {
        case true:
            print("Emulator check: ⛔️")
        case false:
            print("Emulator check: ✅")
        }
        
        return result
    }
    
    // ...........
    
    /**
     This type method is used to determine if application is being debugged
     
     Usage example
     ```
     let amIDebugged = SecuritySuite.amIDebugged() ? true : false
     ```
     */
    public static func amIDebugged() -> Bool {
        
        let result = DebuggerChecker.amIDebugged()
        
        switch result {
        case true:
            print("Debugger check: ⛔️")
        case false:
            print("Debugger check: ✅")
        }
        
        return result
    }
    
    // ...........
    
    /**
     This type method is used to deny debugger and improve the application resillency
     
     Usage example
     ```
     SecuritySuite.denyDebugger()
     ```
     */
    public static func denyDebugger() {
        return DebuggerChecker.denyDebugger()
    }
    
    // ...........
    
    /**
     This type method is used to determine if there are any popular reverse engineering tools installed on the device
     
     Usage example
     ```
     let amIReverseEngineered = SecuritySuite.amIReverseEngineered() ? true : false
     ```
     */
    public static func amIReverseEngineered() -> Bool {
        
        let result = ReverseEngineeringToolsChecker.amIReverseEngineered()
        
        switch result {
        case true:
            print("Reverse Engineering check: ⛔️")
        case false:
            print("Reverse Engineering check: ✅")
        }
        
        return result
    }
}
