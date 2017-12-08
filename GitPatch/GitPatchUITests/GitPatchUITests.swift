//
//  GitPatchUITests.swift
//  GitPatchUITests
//
//  Created by Rolland Cédric on 04.12.17.
//  Copyright © 2017 Rolland Cédric. All rights reserved.
//

import XCTest

class GitPatchUITests: XCTestCase {
    
    var app:XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
        app = XCUIApplication()
    }
    
    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    func testShowUsersList() {
        showUser()
        let navBar = app.navigationBars["Gitpatch"]
        XCTAssertTrue(navBar.exists)
        let upArrowButton = navBar.buttons["up arrow"]
        XCTAssertTrue(upArrowButton.exists)
        upArrowButton.tap()
        app.swipeUp()
        XCTAssertTrue(navBar.exists)
    }
    
    func testInfinitScrollUser() {
        showUser()
        let usersTable = app.tables["usersTable"]
        XCTAssertNotNil(usersTable)
        usersTable.swipeUp()
        usersTable.swipeUp()
        usersTable.swipeUp()
    }
    
    func testUserDetails() {
        showUser()
        let usersTable = app.tables["usersTable"]
        XCTAssertNotNil(usersTable)
        usersTable.cells.staticTexts["mojombo"].tap()
        
        let userDetailsTable = app.tables["userDetailsTable"]
        XCTAssertNotNil(userDetailsTable)
        
        let userDetailCell = userDetailsTable.cells.staticTexts["Following"]
        XCTAssertTrue(userDetailCell.waitForExistence(timeout: 10))
        
        let followersCell = userDetailsTable.cells.staticTexts["tokuda109"]
        XCTAssertTrue(followersCell.waitForExistence(timeout: 10))
        followersCell.swipeLeft()
        
        let reposCell = userDetailsTable.cells.staticTexts["asteroids"]
        XCTAssertTrue(reposCell.waitForExistence(timeout: 10))
        reposCell.swipeUp()
    }
    
    func testUserReccurency() {
        showUser()
        let usersTable = app.tables["usersTable"]
        XCTAssertNotNil(usersTable)
        usersTable.cells.staticTexts["mojombo"].tap()
        
        let userDetailsTable = app.tables["userDetailsTable"]
        XCTAssertNotNil(userDetailsTable)
        
        let followersCell = userDetailsTable.cells.staticTexts["tokuda109"]
        XCTAssertTrue(followersCell.waitForExistence(timeout: 10))
        followersCell.tap()
    }
    
    func showUser() {
        let showUsersButton = app.buttons["showUsersButton"]
        XCTAssertNotNil(showUsersButton)
        showUsersButton.tap()
    }
}
