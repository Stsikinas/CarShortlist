//
//  URLConverterTests.swift
//  CarShortlistTests
//
//  Created by Epsilon User on 2/12/22.
//

import XCTest
@testable import CarShortlist

class URLConverterTests: XCTestCase {
    
    var sut: URLConverter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CarsService()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testUrlIsValid() {
        XCTAssertNoThrow(try sut.getFileUrl(from: validEndpoint), "The provided url is valid and should work!")
    }
    
    func testUrlIsEmpty() {
        do {
            _ = try sut.getFileUrl(from: "")
            XCTFail("The link is empty, so error should've been thrown.")
        } catch {
            XCTAssertEqual(error as? ServiceError, ServiceError.NoLinkExists)
        }
    }
    
    func testUrlIsInvalid() {
        do {
            _ = try sut.getFileUrl(from: invalidEndpoint)
            XCTFail("The link is invalid, so error should've been thrown.")
        } catch {
            XCTAssertEqual(error as? ServiceError, ServiceError.EndpointNotValid)
        }
    }
}
