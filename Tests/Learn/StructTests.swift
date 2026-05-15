import Testing

struct SimpleStruct {
  var name: String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    return String((0..<10).compactMap { _ in letters.randomElement() })
  }
}

@Test func testSimpleStructName() async throws {
  let s = SimpleStruct()
  #expect(s.name.count == 10)
  // print(s.name)
  // print(s.name)
  // different rand string every reading
  #expect(s.name != s.name)
  #expect(type(of: s) == SimpleStruct.self)
}
