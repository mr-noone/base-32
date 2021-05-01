import XCTest
import Base32

final class Base32Tests: XCTestCase {
  static var allTests = [
    ("testBase32Decoding", testBase32Decoding),
    ("testBase32Encoding", testBase32Encoding)
  ]
  
  func testBase32Decoding() {
    let one = "QWERTY".data(using: .utf8)
    let two = Data(base32Encoded: "KFLUKUSULE")
    XCTAssertEqual(one, two)
  }
  
  func testBase32Encoding() {
    let data = "QWERTY".data(using: .utf8)
    XCTAssertEqual(data?.base32EncodedString(), "KFLUKUSULE")
  }
}
