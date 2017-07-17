//
//  MoviesVisualTests.swift
//  MoviesVisualTests
//
//  Created by Bastien Cojan on 13/07/2017.
//  Copyright © 2017 iKode Ltd. All rights reserved.
//

import XCTest

class MoviesVisualTests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launchArguments += ["canned_responses"]
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testVisualTests() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        snapshot("Home page")
        XCUIApplication().tables.staticTexts["Despicable Me 3"].tap()

        snapshot("Despicable me 3")
        XCUIApplication().tables.cells.containing(.staticText, identifier:"View all similar movies").children(matching: .button).element(boundBy: 0).tap()
        
        snapshot("Related movies")
        XCUIApplication().collectionViews.cells["Minions"].otherElements.containing(.image, identifier:"movie_icon_gradient_overlay").element.tap()
        
//        wait(for: <#T##[XCTestExpectation]#>, timeout: <#T##TimeInterval#>)
        sleep(1)
        snapshot("Minions")
        
        
        
    }
    
}
