//
//  ExtensionTests.swift
//  MissingNoodlePortfolioTests
//
//  Created by Tami Black on 2/3/21.
//

import XCTest
import MNAdditions
import SwiftUI
@testable import MissingNoodlePortfolio

class ExtensionTests: XCTestCase {

    func testSequenceKeyPathSortingSelf() {
        let items = [1, 2, 3, 4, 5]
        let sortedItems = items.sorted(by: \.self)
        XCTAssertEqual(sortedItems, [1, 2, 3, 4, 5], "The sorted numbers must be ascending.")
    }

    func testSequenceKeyPathSortingCustom() {
        struct Example: Equatable {
            let value: String
        }

        let example1 = Example(value: "a")
        let example2 = Example(value: "b")
        let example3 = Example(value: "c")
        let array = [example1, example2, example3]

        let sortedItems = array.sorted(by: \.value) {
            $0 > $1
        }

        XCTAssertEqual(sortedItems, [example3, example2, example1], "Reverse sorting should yield c, b, a.")
    }

    func testBundleDecodingAwards() {
        let awards = Bundle.main.decode([Award].self,
                                        from: "Awards.json",
                                        fromBundleWithClass: DataController.self
        )
        XCTAssertFalse(awards.isEmpty, "Awards.json should decode to a non-empty array.")
    }

    func testDecodingString() {
        let bundle = Bundle(for: ExtensionTests.self)
        let data = bundle.decode(
            String.self,
            from: "DecodableString.json",
            fromBundleWithClass: ExtensionTests.self
        )
        XCTAssertEqual(data,
                       "The rain in Spain mostly falls on the Spaniards.",
                       "The string must mathe the content of DecodableString.json"
        )
    }

    func testDecodingDictionary() {
        let bundle = Bundle(for: ExtensionTests.self)
        let data = bundle.decode(
            [String: Int].self,
            from: "DecodableDictionary.json",
            fromBundleWithClass: ExtensionTests.self)
        XCTAssertEqual(data.count, 3, "There should be 3 items decoded from DecodableDictionary.json.")
        XCTAssertEqual(data["One"], 1, "The dictionary should contain Int to String mappings.")
    }

    func testBindingOnChange() {
        // Given
        var onChangeFunctionRun = false

        func exampleFunctionToCall() {
            onChangeFunctionRun = true
        }

        var storedValue = ""

        let binding = Binding(
            get: { storedValue },
            set: { storedValue = $0 }
        )

        let changedBinding = binding.onChange(exampleFunctionToCall)

        // When
        changedBinding.wrappedValue = "Test"

        // Then
        XCTAssertTrue(onChangeFunctionRun, "The onChange() function must be run when the binding is changed.")

    }
}
