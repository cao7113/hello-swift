import Testing

// https://developer.apple.com/documentation/testing
// https://developer.apple.com/documentation/testing/migratingfromxctest

// struct as suite
struct TryTests {
  // https://developer.apple.com/documentation/testing/migratingfromxctest#Record-issues
  @Test(.disabled("Just demo skip this")) func testDisabled() {
    // Like XCFail("xxx")
    Issue.record("Just mock uncondtional fail")
  }

  @Test func testBool() {
    #expect(true)
    #expect(!false)

    #expect(nil == nil)
    #expect(0 != nil)

    // #expect(throws: (any Error).self) { try f() }
    // #expect(throws: Never.self) { try f() }
  }

  // Swift 允许在**单表达式函数（single-expression function）和计算属性（computed property）**中省略 return 关键字。也就是说，当函数或计算属性的 主体只有一行代码 时，Swift 可以隐式地推断 return 语句。
  func returnValue() -> Int {
    42
  }

  func returnValueExplicit() -> Int {
    return 42
  }

  @Test func testReturnValueWithoutReturnKey() {
    #expect(returnValue() == 42)
    #expect(returnValueExplicit() == 42)
  }
}
