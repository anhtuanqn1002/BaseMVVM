//
//  SampleTests.swift
//  BaseMVVMTests
//
//  Created by Tuan Nguyen on 18/03/2023.
//

import XCTest
@testable import BaseMVVM
import Moya

final class SampleTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let jsonString = """
{
        "status": {
          "verified": null,
          "sentCount": 0
        },
        "_id": "64071438201e5eeeda86acdf",
        "user": "63fdd47e697b12a2af3d3234",
        "text": "Qwe123.",
        "type": "cat",
        "deleted": false,
        "createdAt": "2023-03-07T10:38:48.370Z",
        "updatedAt": "2023-03-07T10:38:48.370Z",
        "__v": 0
}
"""
        let data = try JSONEncoder().encode(jsonString)

        let customEndpointClosure = { (target: CatFacts) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(100, data) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
//        let provider = MoyaProvider<Sample>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        let provider = MoyaProvider<CatFacts>()
        let api = CatFactsAPI(provider: provider)
        let viewModel = CatFactsViewModel(network: api)
        let expectation = expectation(description: "wait wait wait")
        viewModel.getFacts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            XCTAssertEqual(viewModel.user, "63fdd47e697b12a2af3d3234")
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
