import Testing

// https://developer.apple.com/documentation/testing/migratingfromxctest

// as suite
struct TryAsserts {
  @Test func testBool() {
    #expect(true)
    #expect(!false)

    #expect(nil == nil)
    #expect(0 != nil)

    // #expect(throws: (any Error).self) { try f() }
    // #expect(throws: Never.self) { try f() }
  }
}
