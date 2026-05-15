import Foundation
import Testing

// 测试 Foundation 字符串操作：将字符串转换为大写
@Test func testFoundationString() {
  let original = "hello, world!"
  let result = original.uppercased()
  let expected = "HELLO, WORLD!"
  #expect(result == expected)
  #expect("".isEmpty)
}

// 测试网络请求，使用 URLSession 从 example.com 获取数据
@Test func testNetworkRequest() async throws {
  // 确保 URL 有效
  guard let url = URL(string: "http://example.com") else {
    throw URLError(.badURL)
  }

  // 使用 URLSession 发起网络请求
  let (data, response) = try await URLSession.shared.data(from: url)

  // 检查响应类型是否为 HTTPURLResponse
  guard let httpResponse = response as? HTTPURLResponse else {
    throw URLError(.badServerResponse)
  }

  // 检查 HTTP 状态码是否为 200
  #expect(httpResponse.statusCode == 200)
  // 检查返回的数据非空
  #expect(data.count > 0)
}

// 测试针对默认 JSON API 的网络请求
// @Test func testDefaultJSONAPI() async throws {
//   // 使用一个公开的 JSON API 作为测试目标
//   guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else {
//     throw URLError(.badURL)
//   }

//   // 发起网络请求
//   let (data, response) = try await URLSession.shared.data(from: url)

//   // 检查响应类型是否为 HTTPURLResponse
//   guard let httpResponse = response as? HTTPURLResponse else {
//     throw URLError(.badServerResponse)
//   }

//   // 检查 HTTP 状态码是否为 200
//   #expect(httpResponse.statusCode == 200)
//   // 检查返回的数据非空
//   #expect(data.count > 0)

//   // 定义 JSON 对象的数据结构
//   struct Todo: Codable {
//     let userId: Int
//     let id: Int
//     let title: String
//     let completed: Bool
//   }

//   // 解码 JSON 数据
//   let todo = try JSONDecoder().decode(Todo.self, from: data)

//   // 检查 JSON 中的 id 是否为 1
//   #expect(todo.id == 1)
// }
