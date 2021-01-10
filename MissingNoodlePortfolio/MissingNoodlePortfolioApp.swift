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
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
                           perform: save)
        }
    }

    func save(_ note: Notification) {
        coreDataController.save()
    }
}
