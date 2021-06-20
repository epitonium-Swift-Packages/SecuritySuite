//
//  DebuggerChecker.swift
//  SecuritySuite
//
//  Created by Vitalis Girsas on 23/01/2020.
//  Copyright © 2019 Neiron Digital. All rights reserved.
//

import Foundation
// ...........
internal class DebuggerChecker {
    //  MARK: - METHODS 🔄 INTERNAL
    // ///////////////////////////////////////////
    // https://developer.apple.com/library/archive/qa/qa1361/_index.html
    internal static func amIDebugged() -> Bool {
        var kinfo = kinfo_proc()
        var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout<kinfo_proc>.stride
        let sysctlRet = sysctl(&mib, UInt32(mib.count), &kinfo, &size, nil, 0)
        if sysctlRet != 0 {
            Logger.logAdapter?.error(mesage: "SecuritySuite: Error occured when calling sysctl(). The debugger check may be not reliable")
        }
        return (kinfo.kp_proc.p_flag & P_TRACED) != 0
    }
    // ...........
    internal static func denyDebugger() {
        // bind ptrace()
        let pointerToPtrace = UnsafeMutableRawPointer(bitPattern: -2)
        let ptracePtr = dlsym(pointerToPtrace, "ptrace")
        typealias PtraceType = @convention(c) (CInt, pid_t, CInt, CInt) -> CInt
        let ptrace = unsafeBitCast(ptracePtr, to: PtraceType.self)
        // PT_DENY_ATTACH == 31
        let ptraceRet = ptrace(31, 0, 0, 0)
        if ptraceRet != 0 {
            Logger.logAdapter?.error(mesage: "SecuritySuite: Error occured when calling ptrace(). Denying debugger may not be reliable")
        }
    }
}
