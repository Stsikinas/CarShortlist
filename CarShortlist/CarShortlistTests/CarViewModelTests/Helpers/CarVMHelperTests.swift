//
//  CarVMHelperTests.swift
//  CarShortlistTests
//
//  Created by Epsilon User on 5/12/22.
//

import XCTest
@testable import CarShortlist

class CarVMHelperTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testConvertToEuros() {
        let price = "21.500"
        
        XCTAssertEqual("21.500 €", price.toEuros, "The values should've been equal")
    }
}
