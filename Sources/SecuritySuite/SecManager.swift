//
//  SecManager.swift
//  SecuritySuite
//
//  Created by Vitalis on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//


import Foundation

// ...........

class SecManager {
    
    //                                      MARK: - CONTROLS
    //..............................................................................................
    
    // MARK: Default values
    
    fileprivate struct DefaultValues {
        
        static var isJailBrokenCheckEnabled         = true
        static var isDebuggerCheckEnabled           = true
        static var isEmulatorCheckEnabled           = true
        static var isReverseEngineeringCheckEnabled = true
    }
    
    //                                      MARK: - STRUCTURE
    //..............................................................................................
    
    enum SecError: Error, CustomStringConvertible {
        
        case jailBroken
        case debugger
        case emulator
        case reverseEngineering
        
        var description: String {
            return errorDescription
        }
    }
    
    // ...........
    
    enum SecManagerHandleResult {

        case succes
        case failure(SecError)
    }
    
    //  MARK: - PROPERTIES 🔰 PRIVATE
    // ////////////////////////////////////
    
    static var errorDescription = "This application cannot run on this device"
    
    // ...........
    
    static var argc: Int32 {
        CommandLine.argc
    }
    
    // ...........
    
    static var argv: [String] {
        CommandLine.arguments
    }
    
    // ...........
    
    static var appPath: UnsafeMutablePointer<Int8>? {
        
        guard let item = argv.getItem(forIndex: 0) else {
            Log.error("NO argv[0]")
            return nil
        }
        
        guard let argv0 = UnsafeMutablePointer<Int8>(mutating: (item as NSString).utf8String) else {
            Log.error("CANNOT CAST TO UnsafeMutablePointer<Int8>")
            return nil
        }
        
        return argv0
    }
    
    //  MARK: - SETUPS
    // ///////////////////////////////////////////
    
    static func setup(isJailBrokenCheckEnabled: Bool,
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
    
    static func handleResult() -> SecManagerHandleResult {
        
        switch internalHandleResult() {
        case .succes:
            return .succes
        case .failure(let error):
            
            manageWindowsAndShowAlert(with: error)
            return .failure(error)
        }
    }
    
    //  MARK: - METHODS 🔰 PRIVATE
    // ///////////////////////////////////////////
    
    private static func internalHandleResult() -> SecManagerHandleResult {

        // Check Jailbroken
        
        if DefaultValues.isJailBrokenCheckEnabled {
            guard !SecuritySuite.amIJailbroken() else {
                return .failure(.jailBroken)
            }
        }
        
        // Check Debugger
        
        if DefaultValues.isDebuggerCheckEnabled {
            guard !SecuritySuite.amIDebugged() else {
                return .failure(.debugger)
            }
        }
        
        // Check Emulator
        
        if DefaultValues.isEmulatorCheckEnabled {
            guard !SecuritySuite.amIRunInEmulator() else {
                return .failure(.emulator)
            }
        }
        
        // Check Reverse Engineering
        
        if DefaultValues.isReverseEngineeringCheckEnabled {
            guard !SecuritySuite.amIReverseEngineered() else {
                return .failure(.reverseEngineering)
            }
        }
        
        return .succes
    }
    
    // ...........
    
    private static func manageWindowsAndShowAlert(with error: SecError) {
        
        // Create window

        appDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = appDelegate.window else {
            Log.error("COULD NOT CREATE WINDOW")
            return
        }
        
        // Window properties
        
        window.backgroundColor = UIColor.white
        
        // Create controller
        
        let controller = EnvironmentManager.get(controller: .launch)
        
        // Set controller
        
        window.rootViewController = controller
        window.makeKeyAndVisible()
        
        // Present alert
        
        present(error: error, inside: controller)
    }
    
    // ...........
    
    private static func present(error: SecError, inside controller: UIViewController) {
        
        let presentAction = { [weak controller] in
            guard let vc = controller else { return }
            present(error: error, inside: vc)
        }
        
        let message = error.description
        
        presentAlert(with: message, inside: controller, action: presentAction)
    }
    
    // ...........
    
    private static func presentAlert(with message: String, inside controller: UIViewController, action: @escaping VoidClosure) {
        AlertManager.display(alert: .messageWithOkButton, inside: controller, additionalStrings: [message], actions: [action])
    }
}
