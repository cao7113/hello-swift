import Testing

class Person {
  var name: String
  var age: Int

  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }

  func greet() -> String {
    return "My name is \(name), \(age) age old."
  }
}

@Test func TestGreet() async throws {
  let p = Person(name: "man", age: 6)
  // wrong Person("man", 66)
  // 初始化方法的参数默认带有外部参数名称，也就是你必须在调用时提供参数标签
  #expect(p.greet() == "My name is man, 6 age old.")
  #expect(type(of: p) == Person.self)
}

class Anonymous {
  var name: String
  var age: Int

  init(_ name: String, _ age: Int) {
    self.name = name
    self.age = age
  }

  func greet() -> String {
    return "My name is \(name), \(age) age old."
  }
}
@Test func TestAnonymousGreet() async throws {
  let p = Anonymous("man", 6)
  // below wrong case with label name
  // let p = Anonymous(name: "man", age: 6)
  #expect(p.greet() == "My name is man, 6 age old.")
  #expect(type(of: p) == Anonymous.self)
}
