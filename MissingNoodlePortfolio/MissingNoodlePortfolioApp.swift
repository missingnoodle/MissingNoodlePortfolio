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
    @StateObject var unlockManager: UnlockManager

    init() {
        let dataController = CoreDataController()
        let unlockManager = UnlockManager(dataController: dataController)

        _coreDataController = StateObject(wrappedValue: dataController)
        _unlockManager = StateObject(wrappedValue: unlockManager)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDataController.container.viewContext)
                .environmentObject(coreDataController)
                .environmentObject(unlockManager)
                .onReceive(
                    // Automatically save when we detect that we are no longer
                    // the foreground app. Use this rather than the scene phase
                    // API so we can port to macOS, where scene phase won't detect
                    // our app losing focus as of macOS 11.1
                    NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification),
                    perform: save
                )
        }
    }

    func save(_ note: Notification) {
        coreDataController.save()
    }
}
