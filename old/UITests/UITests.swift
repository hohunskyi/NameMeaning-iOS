//  UITests.swift
//  UITests
//
//  Created by Alenka Hohunska on 5/16/16.
//  Copyright © 2016 Hohunskyi. All rights reserved.
//

import XCTest

class UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = true
        
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testScreenshots() {
        
        let app = XCUIApplication()
        
      //  XCUIApplication().buttons["Done"].tap()
        
        snapshot("HomeScreen")
        
        let tablesQuery = app.tables
        
        tablesQuery.staticTexts["Aaron"].tap()
        snapshot("DetailsScreen")

        let allCellsInTable = tablesQuery.descendantsMatchingType(.Cell)

        allCellsInTable.elementBoundByIndex(5).tap();
        snapshot("PopularityScreen")

        app.navigationBars.elementBoundByIndex(0).childrenMatchingType(.Button).elementBoundByIndex(0).tap()

        allCellsInTable.elementBoundByIndex(6).tap();
        snapshot("RecommendationsScreen")
    }
    
}
