import XCTest
@testable import SoundCloudKit

final class SoundCloudKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SoundCloudKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
