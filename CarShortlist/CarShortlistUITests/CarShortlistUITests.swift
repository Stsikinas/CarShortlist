//
//  CarShortlistUITests.swift
//  CarShortlistUITests
//
//  Created by Stavros Tsikinas on 2/12/22.
//

import XCTest

class CarShortlistUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testCarSelected() {
        
        /// Tap on first cell (model: Mercedes-Benz)
        let indexPath = IndexPath(row: 0, section: 0)
        
        XCTAssertTrue(app.staticTexts["Cars Shortlist"].exists)
        let myTable = app.tables.matching(identifier: "tableView")
        let firstCell = myTable.cells.element(matching: .cell, identifier: "cell_\(indexPath.row)")
        firstCell.tap()
        
        let titlePredicate = NSPredicate(format: "label BEGINSWITH 'Mercedes-Benz'")
        let title = app.staticTexts.element(matching: titlePredicate)
        
        XCTAssert(title.exists, "The title is 'Mercendes-Benz'")
        
    }
    
    
    
}
