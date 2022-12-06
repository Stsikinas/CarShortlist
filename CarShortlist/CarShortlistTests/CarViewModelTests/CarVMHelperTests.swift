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
    
    func testMakeDetailsAllEmpty() {
        XCTAssertEqual("", makeDetails(det1: "", det2: ""), "The details text should've been empty")
    }
    
    func testMakeDetailsOneEmpty() {
        XCTAssertFalse(makeDetails(det1: "", det2: "Detail 2").contains("-"), "The dash character should not exist in details text")
    }
    
    func testMakeDetailsFull() {
        let car = aCar()
        
        let carDet1 = "\(car.make ?? "") - \(car.model ?? "")"
        
        XCTAssertEqual(carDet1, makeDetails(det1: car.make ?? "", det2: car.model ?? ""), "Details should've been equal")
    }
    
}
