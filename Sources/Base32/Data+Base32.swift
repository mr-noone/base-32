import Foundation
import libbase32

extension Data {
  var bytes: [UInt8] { return Array<UInt8>(self) }
}

public extension Data {
  init?(base32Encoded string: String) {
    guard let data = string.data(using: .utf8)?.bytes else { return nil }
    let bufferSize = (data.count * Int(BITS_PER_BASE32_CHAR) + 4) / 8
    var buffer = Array<UInt8>(repeating: 0x00, count: bufferSize)
    if base32_decode(data, &buffer, Int32(bufferSize)) < 1 { return nil }
    self.init(bytes: buffer, count: bufferSize)
  }
  
  func base32EncodedString() -> String? {
    let bufferSize = (count * 8 + 4) / Int(BITS_PER_BASE32_CHAR)
    var buffer = Array<UInt8>(repeating: 0x00, count: bufferSize)
    if base32_encode(bytes, Int32(count), &buffer, Int32(bufferSize)) < 1 { return nil }
    return String(bytes: buffer, encoding: .utf8)
  }
}
