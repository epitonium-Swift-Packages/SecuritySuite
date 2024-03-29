//
//  MainMethods.swift
//  SecuritySuite
//
//  Created by Vitalis Girsas on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
// ...........
internal class MainMethods {
    //  MARK: - METHODS 🌐 PUBLIC
    // ///////////////////////////////////////////
    /**
     This type method is used to determine the true/false jailbreak status
     
     Usage example
     ```
     let isDeviceJailbroken = MainMethods.amIJailbroken() ? true : false
     ```
     */
    internal static func amIJailbroken() -> Bool {
        let result = JailbreakChecker.amIJailbroken()
        switch result {
        case true:
            Log?.info(mesage: "SecuritySuite: Jailbrake check: ⛔️")
        case false:
            Log?.info(mesage: "SecuritySuite: Jailbrake check: ✅")
        }
        return result
    }
    // ...........
    /**
     This type method is used to determine the jailbreak status with a message which jailbreak indicator was detected
     
     Usage example
     ```
     let jailbreakStatus = MainMethods.amIJailbrokenWithFailMessage()
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
    internal static func amIJailbrokenWithFailMessage() -> (jailbroken: Bool, failMessage: String) {
        JailbreakChecker.amIJailbrokenWithFailMessage()
    }
    // ...........
    /**
     This type method is used to determine if application is run in emulator
     
     Usage example
     ```
     let runInEmulator = MainMethods.amIRunInEmulator() ? true : false
     ```
     */
    internal static func amIRunInEmulator() -> Bool {
        let result = EmulatorChecker.amIRunInEmulator()
        switch result {
        case true:
            Log?.info(mesage: "SecuritySuite: Emulator check: ⛔️")
        case false:
            Log?.info(mesage: "SecuritySuite: Emulator check: ✅")
        }
        return result
    }
    // ...........
    /**
     This type method is used to determine if application is being debugged
     
     Usage example
     ```
     let amIDebugged = MainMethods.amIDebugged() ? true : false
     ```
     */
    internal static func amIDebugged() -> Bool {
        let result = DebuggerChecker.amIDebugged()
        switch result {
        case true:
            Log?.info(mesage: "SecuritySuite: Debugger check: ⛔️")
        case false:
            Log?.info(mesage: "SecuritySuite: Debugger check: ✅")
        }
        return result
    }
    // ...........
    /**
     This type method is used to deny debugger and improve the application resillency
     
     Usage example
     ```
     MainMethods.denyDebugger()
     ```
     */
    internal static func denyDebugger() {
        DebuggerChecker.denyDebugger()
    }
    // ...........
    /**
     This type method is used to determine if there are any popular reverse engineering tools installed on the device
     
     Usage example
     ```
     let amIReverseEngineered = MainMethods.amIReverseEngineered() ? true : false
     ```
     */
    internal static func amIReverseEngineered() -> Bool {
        let result = ReverseEngineeringToolsChecker.amIReverseEngineered()
        switch result {
        case true:
            Log?.info(mesage: "SecuritySuite: Reverse Engineering check: ⛔️")
        case false:
            Log?.info(mesage: "SecuritySuite: Reverse Engineering check: ✅")
        }
        return result
    }
}
