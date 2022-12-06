//
//  JSONParserTests.swift
//  CarShortlistTests
//
//  Created by Epsilon User on 2/12/22.
//

import XCTest
@testable import CarShortlist

class JSONParserTests: XCTestCase {
    
    var sut: JSONParser!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        sut = CarsService()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testFailedTask() {
        
        let expectation = XCTestExpectation(description: "Load Data from JSON")
        
        sut.loadJSON(url: invalidEndpoint) { result in
            switch result {
            case .success( _):
                XCTFail("The endpoint isn't valid. The test has to fail!")
                break
            case .failure(let error):
                XCTAssertNotNil(error)
                break
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testEmptyData() {
        if let data = emptyJSON.data(using: .utf8) {
            XCTAssertThrowsError(try self.sut.parse(data: data, view: nil))
        }
    }
    
    func testValidData() {
        
        let expectation = XCTestExpectation(description: "Convert Data from JSON")
        
        sut.loadJSON(url: validJSONUrl) { result in
            switch result {
            case .success(let data):
                do {
                    let cars = try self.sut.parse(data: data, view: nil)
                    XCTAssertNotNil(cars)
                } catch {
                    XCTFail("The cars couldn't be parsed.")
                }
                break
            case .failure(let error):
                XCTFail("The parsing data retrieval failed. Error: \(error.getDescription)")
            }
            expectation.fulfill()
        }
        
        
    }

}
