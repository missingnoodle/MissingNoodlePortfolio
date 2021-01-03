//
//  MissingNoodlePortfolioApp.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/1/21.
//

import SwiftUI

@main
struct MissingNoodlePortfolioApp: App {
    @StateObject var coreDataController: CoreDataController

    init() {
        let coreDataController = CoreDataController()
        _coreDataController = StateObject(wrappedValue: coreDataController)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataController.container.viewContext)
                .environmentObject(coreDataController)
        }
    }
}
