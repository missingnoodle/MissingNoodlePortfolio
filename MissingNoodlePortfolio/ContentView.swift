//
//  ContentView.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/1/21.
//

import CoreSpotlight
import SwiftUI

struct ContentView: View {
    @SceneStorage("selectedView") var selectedView: String?
    @EnvironmentObject var dataController: CoreDataController
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView(dataController: dataController)
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ProjectsView(dataController: dataController, showClosedProjects: false)
                .tag(ProjectsView.openTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }

            ProjectsView(dataController: dataController, showClosedProjects: true)
                .tag(ProjectsView.closedTag)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }
            AwardsView()
                .tag(AwardsView.tag)
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Awards")
                }
        }
        .onContinueUserActivity(CSSearchableItemActionType, perform: moveToHome)
    }

    func moveToHome(_ input: Any) {
        selectedView = HomeView.tag
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = CoreDataController.preview
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext,
                         dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
