import XCTest
import Base32

final class Base32Tests: XCTestCase {
  static var allTests = [
    ("testBase32Decoding", testBase32Decoding),
    ("testBase32Encoding", testBase32Encoding)
  ]
  
  func testBase32Decoding() {
    let testBytes: [UInt8] = [72, 101, 108, 108, 111, 33, 222, 173, 190, 239]
    let testData = Data(bytes: testBytes, count: testBytes.count)
    let data = Data(base32Encoded: "JBSWY3DPEHPK3PXP")
    XCTAssertEqual(data, testData)
  }
  
  func testBase32Encoding() {
    let testBytes: [UInt8] = [72, 101, 108, 108, 111, 33, 222, 173, 190, 239]
    let base32Str = "JBSWY3DPEHPK3PXP"
    
    let data = Data(bytes: testBytes, count: testBytes.count)
    XCTAssertEqual(data.base32EncodedString(), base32Str)
  }
}
