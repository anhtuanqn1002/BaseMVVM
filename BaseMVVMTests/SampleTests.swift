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

    struct SampleObject: Codable {
        var name = "hihi"
        var value = 100
    }
    
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
        var sample = SampleObject()
        sample.name = "heeloooooooooo1"
        let data = try JSONEncoder().encode(sample)

        let customEndpointClosure = { (target: Sample) -> Endpoint in
            return Endpoint(url: URL(target: target).absoluteString,
                            sampleResponseClosure: { .networkResponse(200, data) },
                            method: target.method,
                            task: target.task,
                            httpHeaderFields: target.headers)
        }
//        let provider = MoyaProvider<Sample>(endpointClosure: customEndpointClosure, stubClosure: MoyaProvider.immediatelyStub)
        let provider = MoyaProvider<Sample>()
        let api = SampleAPI(provider: provider)
        let viewModel = SampleViewModel(network: api)
        let expectation = expectation(description: "wait wait wait")
        viewModel.getFacts()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
