//
//  AsstTests.swift
//  MissingNoodlePortfolioTests
//
//  Created by Tami Black on 1/16/21.
//

import XCTest
@testable import MissingNoodlePortfolio

class AsstTests: XCTestCase {
    func testColorsExist() {
        for color in Project.colors {
            XCTAssertNotNil(UIColor(named: color), "Failed to load color '\(color)' from Colors.xcassets")
        }
    }
}
