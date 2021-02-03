//
//  AsstTests.swift
//  MissingNoodlePortfolioTests
//
//  Created by Tami Black on 1/16/21.
//

import XCTest
@testable import MissingNoodlePortfolio

class AssetTests: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from Colors.xcassets")
        }
    }

    func testJSONLoadsCorrectly() {
        XCTAssertTrue(Award.allAwards.isEmpty == false, "Failed to load awards from JSON.")
    }
}
