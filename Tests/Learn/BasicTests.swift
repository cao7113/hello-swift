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

  @Test func testString() {
    let s = "Hello, world!"
    #expect(s.hasPrefix("Hello"))
    #expect(s.hasSuffix("world!"))
    #expect(s.contains("world"))
    #expect("".isEmpty)
    #expect(type(of: "some string") == String.self)
  }

  @Test func ifLet() {
    let optional: Int? = 42
    if let value = optional {
      #expect(value == 42)
    } else {
      #expect(Bool(false))
    }
  }

  @Test func guardLet() {
    // 定义一个可选 Int，赋值为 42
    let optionalInt: Int? = 42

    // 使用 guard let 尝试解包 optionalInt
    guard let value = optionalInt else {
      // 如果解包失败，则进入 else 分支
      #expect(Bool(false), "optionalInt 为 nil")
      return
    }

    // 如果解包成功，value 已经是 Int 类型，可以安全使用
    #expect(value == 42)
  }
}
