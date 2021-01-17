//
//  MissingNoodlePortfolioTests.swift
//  MissingNoodlePortfolioTests
//
//  Created by Tami Black on 1/16/21.
//

import CoreData
import XCTest
@testable import MissingNoodlePortfolio

class MissingNoodleBaseTestCase: XCTestCase {
    var dataController: CoreDataController!
    var managedObjectContext: NSManagedObjectContext!

    override func setUpWithError() throws {
        dataController = CoreDataController(inMemory: true)
        managedObjectContext = dataController.container.viewContext
    }

}
