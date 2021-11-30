import CustomDump
import FirstPartyMocks
import Foundation
#if canImport(FoundationNetworking)
  import FoundationNetworking
#endif
import Overture
import SharedModels
import TestHelpers
import Parsing
import URLRouting
import XCTest

@testable import ServerRouter

class ConfigTests: XCTestCase {
  func testConfig() throws {
    var expectedRequest = URLRequest(
      url: URL(string: "/api/config?accessToken=DEADBEEF-DEAD-BEEF-DEAD-BEEFDEADBEEF")!
    )
    expectedRequest.httpMethod = "GET"
    expectedRequest.allHTTPHeaderFields = [:]
    let expectedRoute = ServerRoute.api(
      .init(
        accessToken: .init(rawValue: .deadbeef),
        isDebug: false,
        route: .config
      )
    )

    XCTAssertNoDifference(
      testRouter.match(request: expectedRequest),
      expectedRoute
    )

    XCTAssertNoDifference(
      testRouter.request(
        for: .api(
          .init(
            accessToken: .init(rawValue: .deadbeef),
            isDebug: false,
            route: .config
          )
        )
      ),
      expectedRequest
    )
  }
}
