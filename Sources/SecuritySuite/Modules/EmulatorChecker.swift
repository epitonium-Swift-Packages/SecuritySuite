//
//  EmulatorChecker.swift
//  SecuritySuite
//
//  Created by Vitalis Girsas on 10/04/2025.
//  Copyright © 2025 Neiron Digital. All rights reserved.
//

import Foundation

internal class EmulatorChecker {
  static func amIRunInEmulator() -> Bool {
    return checkCompile() || checkRuntime()
  }

  private static func checkRuntime() -> Bool {
    return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
  }

  private static func checkCompile() -> Bool {
#if targetEnvironment(simulator)
    return true
#else
    return false
#endif
  }
}
