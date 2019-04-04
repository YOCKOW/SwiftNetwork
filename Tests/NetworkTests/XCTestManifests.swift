#if !canImport(ObjectiveC)
import XCTest

extension CTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__CTests = [
        ("testCIPAddress", testCIPAddress),
        ("testCUNIXSocketAddress", testCUNIXSocketAddress),
        ("testIPAddress", testIPAddress),
        ("testSocketAddress", testSocketAddress),
    ]
}

extension DomainLabelTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DomainLabelTests = [
        ("testInitialization", testInitialization),
        ("testInitialization_bidi", testInitialization_bidi),
        ("testInitialization_contextJ", testInitialization_contextJ),
        ("testInitialization_contextO", testInitialization_contextO),
        ("testInitialization_empty", testInitialization_empty),
        ("testInitialization_fullStop", testInitialization_fullStop),
        ("testInitialization_hyphens", testInitialization_hyphens),
        ("testInitialization_idna", testInitialization_idna),
        ("testInitialization_length", testInitialization_length),
        ("testInitialization_mark", testInitialization_mark),
        ("testInitialization_notNFC", testInitialization_notNFC),
    ]
}

extension DomainPublicSuffixTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DomainPublicSuffixTests = [
        ("test", test),
    ]
}

extension DomainTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__DomainTests = [
        ("test_domainMatching", test_domainMatching),
        ("testInitialization", testInitialization),
    ]
}

extension URLHostTests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__URLHostTests = [
        ("test_domainMatching", test_domainMatching),
        ("testInitialization", testInitialization),
    ]
}

extension URLIDNATests {
    // DO NOT MODIFY: This is autogenerated, use:
    //   `swift test --generate-linuxmain`
    // to regenerate.
    static let __allTests__URLIDNATests = [
        ("testInitialization", testInitialization),
    ]
}

public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CTests.__allTests__CTests),
        testCase(DomainLabelTests.__allTests__DomainLabelTests),
        testCase(DomainPublicSuffixTests.__allTests__DomainPublicSuffixTests),
        testCase(DomainTests.__allTests__DomainTests),
        testCase(URLHostTests.__allTests__URLHostTests),
        testCase(URLIDNATests.__allTests__URLIDNATests),
    ]
}
#endif
