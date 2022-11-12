<p align="center">
    <img src="Images/logo.svg" width="180" height="180"/>
</p>

<h1 align="center">SecuritySuite</h1>

<p align="center">
<img src="https://img.shields.io/badge/SPM-Swift%20Package-FA7343?logo=Swift&style=for-the-badge&logoColor=white" alt="Swift Package">
<br>
<br>
    <img src="https://img.shields.io/badge/Platform-iOS-blue.svg" /></a>
</p>

## Description

iOS platform security & anti-tampering Swift library. Refactored version of the [IOSSecuritySuite](https://github.com/securing/IOSSecuritySuite) by [securing](https://github.com/securing).

## Integration

Use `Swift Package Manager` to integrate.

## Usage

```swift
// Setup.
SecuritySuite.setup(.enabled(isJailBrokenCheckEnabled: true,
                             isDebuggerCheckEnabled: true,
                             isEmulatorCheckEnabled: true,
                             isReverseEngineeringCheckEnabled: true))

// Get security check result.
// If the first true condition check was met the later checks are stopped.
switch SecuritySuite.checkSecurityIssues() {
case .succes:
    // Proceed to normal flow.
case .failure(let securityError):
    // Present cannot proceed scene.
}
```

## Logging

`SecuritySuite` uses its own printing methods to log errors or success by default, but if you want those messages to pass through your own logging system create an adapter instance by conforming to `SecuritySuiteLogAdapter` protocol and pass it as `log` parameter when calling `setup` function or you can completely disable it.

## License
`SecuritySuite` is distributed under the terms and conditions of the [LICENSE](https://github.com/epitonium-Swift-Packages/SecuritySuite/blob/master/LICENSE).
