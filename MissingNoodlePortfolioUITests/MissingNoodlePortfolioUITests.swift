//
//  MissingNoodlePortfolioUITests.swift
//  MissingNoodlePortfolioUITests
//
//  Created by Tami Black on 3/12/21.
//

import XCTest

class MissingNoodlePortfolioUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false

        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launchArguments = ["enable-uitesting"]
        app.launch()
    }

    func testAppHas4Tabs() throws {
        // Find the current tab bar and the buttons inside it and count them
        XCTAssertEqual(app.tabBars.buttons.count, 4, "There should be 4 tabs in the app.")
    }

    func testOpenTabAddsProjects() {
        app.buttons["Open"].tap()
        XCTAssertEqual(app.tables.cells.count, 0, "The should be no list rows initially.")

        for tapCount in 1...5 {
            app.buttons["add"].tap()
            XCTAssertEqual(app.tables.cells.count, tapCount, "The should be \(tapCount) list row(s) initially.")
        }
    }

    func testAddingItemInsertsRows() {
        app.buttons["Open"].tap()
        XCTAssertEqual(app.tables.cells.count, 0, "The should be no list rows initially.")

        app.buttons["add"].tap()
        XCTAssertEqual(app.tables.cells.count, 1, "The should be 1 list row after adding a project")

        app.buttons["Add New Item"].tap()
        XCTAssertEqual(app.tables.cells.count, 2, "The should be 2 list rows after adding an item")
    }

    func testEditingProjectUpdatesCorrectly() {
        app.buttons["Open"].tap()
        XCTAssertEqual(app.tables.cells.count, 0, "There should be no list rows initially.")

        app.buttons["add"].tap()
        XCTAssertEqual(app.tables.cells.count, 1, "The should be 1 list row after adding a project")

        app.buttons["NEW PROJECT"].tap()
        app.textFields["Project name"].tap()

        app.keys["space"].tap()
        app.keys["more"].tap()
        app.keys["2"].tap()
        app.buttons["Return"].tap()

        app.buttons["Open Projects"].tap()
        XCTAssertTrue(app.buttons["NEW PROJECT 2"].exists, "The new project name should be visible in the list.")

    }

    func testEditingItemUpdatesCorrectly() {
        // Go to Open projects and add one project and one item before the test,
        // generally not a great idea to have one test call another, but
        // in this case all tests run independently
        testAddingItemInsertsRows()

        app.buttons["New Item"].tap()
        app.textFields["Item name"].tap()

        app.keys["space"].tap()
        app.keys["more"].tap()
        app.keys["2"].tap()
        app.buttons["Return"].tap()

        app.buttons["Open Projects"].tap()
        XCTAssertTrue(app.buttons["New Item 2"].waitForExistence(timeout: 1),
                      "The new item name should be visible in the list."
        )
    }

    func testAllAwardsShowLockedAlert() {
        app.buttons["Awards"].tap()

        for award in app.scrollViews.buttons.allElementsBoundByIndex {
            award.tap()

            XCTAssert(app.alerts["Locked"].exists, "There should be a locked alert showing for awards.")
            app.buttons["OK"].tap()
        }
    }
}
