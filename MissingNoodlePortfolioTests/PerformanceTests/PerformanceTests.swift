//
//  PerformanceTests.swift
//  MissingNoodlePortfolioTests
//
//  Created by Tami Black on 3/12/21.
//

import XCTest
@testable import MissingNoodlePortfolio

class PerformanceTests: MissingNoodleBaseTestCase {
    func testAwardCalulationPerformance() throws {
        // Create a significant amout of test data
        for _ in 1...100 {
            try dataController.createSampleData()
        }

        // Simulate lots of awards to check
        let awards = Array(repeating: Award.allAwards, count: 25).joined()

        // Verify that the test criteria is not changed over time.
        XCTAssertEqual(awards.count, 500, "This checks the number of awards is constant. Change this if new awards are added.")

        measure {
            _ = awards.filter(dataController.hasEarned)
        }
    }
}
