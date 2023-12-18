//
//  PaginationProviderTest.swift
//  StackOverflowUnitTests
//
//  Created by Arthur on 18.12.23.
//

import XCTest
@testable import StackOverflow

final class PaginationProviderTest: XCTestCase {

	
	var paginationManager: PaginationManager!
	
    override func setUp() {
        paginationManager = PaginationManager()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
}
