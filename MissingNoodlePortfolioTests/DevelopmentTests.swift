//
//  DevelopmentTests.swift
//  MissingNoodlePortfolioTests
//
//  Created by Tami Black on 2/3/21.
//

import CoreData
import XCTest
@testable import MissingNoodlePortfolio

class DevelopmentTests: MissingNoodleBaseTestCase {
    func testSampleDataCreationWorks() throws {
        try dataController.createSampleData()

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 5, "There should be 5 sample projects.")
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 50, "There should be 50 sample items.")
    }

    func testDeleteAllClearsEverything() throws {
        try dataController.createSampleData()

        dataController.deleteAll()

        XCTAssertEqual(dataController.count(for: Project.fetchRequest()), 0, "deleteAll() should leave 0 projects.")
        XCTAssertEqual(dataController.count(for: Item.fetchRequest()), 0, "deleteAll() should leave 0 items.")
    }

    func testExampleProjectIsClosed() {
        let project = Project.example
        XCTAssertTrue(project.closed, "The example project should be closed.")
    }

    func textExampleItemIsHighPriority() {
        let item = Item.example
        XCTAssertEqual(item.priority, 3, " The sample item should be high priority.")
    }
}
