import Testing

// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/guidedtour

// print(Int)       // 输出：Int
// print(Int.self)  // 输出：Int
// print(42.self)   // 输出：42

struct BasicTests {
  @Test func testEquals() {
    #expect(1 == 1, "1 == 1")
    #expect(0 != 1, "0 != 1")
    // #expect(1 === 1)

    // declare variables by `var`
    var a = 0
    a = 1
    #expect(a == 1)

    // declare constant by `let`
    let c = 0
    // fail to reassign
    // c = 2
    #expect(c == 0)
  }

  @Test func testArray() async throws {
    var a = [0]
    a.append(1)
    #expect(a == [0, 1])
  }
}
