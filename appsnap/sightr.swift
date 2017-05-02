//
//  appsnap.swift
//  appsnap
//
//  Created by Bastien Cojan on 27/12/2016.
//  Copyright © 2016 iKode Ltd. All rights reserved.
//

import XCTest

class appsnap: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launchArguments = ["network_stubbing"] ;
        setupSnapshot(app)
        app.launch()
    }
    
    
    func testSmoketest() {
        
        let app = XCUIApplication()
        
        // tap the first cell
        let cells = app.tables.cells
        cells.element(boundBy: 0).tap()
        
        //Screenshot Rogue One: a star wars story
        snapshot("Rogue One: a star wars story")
        
        // tap similar movies
        XCUIApplication().tables.cells.containing(.staticText, identifier:"View all similar movies").buttons["btn round next"].tap()
        
        // screenshot similar movies
        snapshot("Similar Movies")
        
        //select star wars
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.children(matching: .image).element(boundBy: 0).tap()
        
        // snapshot star wars episode IV: a new hope
        snapshot("star wars episode IV: a new hope")
        
        //back to similar movies
        app.buttons["back icon"].tap()
        
        // snapshot back to similar movies
        snapshot("back to similar movies")
        
        // select 1st similar movie
        app.navigationBars["Similar Movies"].children(matching: .button).element(boundBy: 0).tap()
        
        //screenshot back to Rogue on: a star wars story
        snapshot("back to Rogue on: a star wars story")
        
        //go back
        app.buttons["back icon"].tap()
        
        // screenshot home screen
        snapshot("home screen")
    }
    
}
