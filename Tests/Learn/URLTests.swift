import Foundation
import Testing
import XCTest

// todo add tags to filter

struct URLTests {
  @Test func testRemoteRequest() async throws {
    let location = "https://notion-data-helper.shareup.workers.dev/ping"
    let url = URL(string: location)!
    let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
    // 将 data 转换为字符串 Data as String: {"message":"Pong"}
    // if let dataString = String(data: data, encoding: .utf8) {
    //   print("Data as String:\(dataString)")
    // } else {
    //   print("无法将 data 转换为字符串")
    // }

    // 将 data 转换为 JSON 对象
    // 注意：服务器返回的数据必须是合法的 JSON 格式，否则转换会抛出异常
    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
    // print("Data as JSON:\n\(jsonObject)")
    // 尝试将 jsonObject 转换为字典，并取出 "message" 字段
    if let jsonDict = jsonObject as? [String: Any],
      let message = jsonDict["message"] as? String
    {
      #expect(message == "Pong")
    } else {
      // 如果转换失败，则测试失败
      XCTFail("无法获取到 message 字段")
    }
  }
}
