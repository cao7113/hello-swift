import Testing

// Trailing Closure（尾随闭包）是一种语法特性，用于简化将闭包作为函数或构造器的最后一个参数传入时的写法
func doSomething(action: () -> Int) -> Int {
  action()
}

@Test func testDoSomething() {
  let oldStyle = doSomething(action: {
    42
  })

  let betterStyle = doSomething {
    42
  }
  #expect(oldStyle == 42)
  #expect(betterStyle == 42)
}
