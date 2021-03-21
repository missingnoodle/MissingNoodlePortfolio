//
//  ProjectsViewModel.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 3/13/21.
//

import CoreData
import Foundation

extension ProjectsView {
    class ViewModel: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
        let dataController: CoreDataController
        var sortOrder = Item.SortOrder.optimized
        let showClosedProjects: Bool

        private let projectsController: NSFetchedResultsController<Project>
        @Published var projects = [Project]()

        init(dataController: CoreDataController, showClosedProjects: Bool) {
            self.dataController = dataController
            self.showClosedProjects = showClosedProjects

            let request: NSFetchRequest<Project> = Project.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)]
            request.predicate = NSPredicate(format: "closed = %d", showClosedProjects)

            projectsController = NSFetchedResultsController(
                fetchRequest: request,
                managedObjectContext: dataController.container.viewContext,
                sectionNameKeyPath: nil,
                cacheName: nil
            )

            super.init()
            projectsController.delegate = self

            do {
                try projectsController.performFetch()
                projects = projectsController.fetchedObjects ?? []
            } catch {
                print("Failed to fetch our items!")
            }
        }

        func addProject() {
            let project = Project(context: dataController.container.viewContext)
            project.closed = false
            project.creationDate = Date()
            dataController.save()
        }

        func addItem(to project: Project) {
            let item = Item(context: dataController.container.viewContext)
            item.project = project
            item.creationDate = Date()
            dataController.save()
    }

        func delete(_ offsets: IndexSet, from project: Project) {
            // projectItems, does a lot of work, sorting, etc. we don't
            // want to do all that sortng each time through the for loop below
            let allItems = project.projectItems(using: sortOrder)
            for offset in offsets {
                let item = allItems[offset]
                dataController.delete(item)
            }
            dataController.save()
        }

        func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
            if let newProjects = controller.fetchedObjects as? [Project] {
                projects = newProjects
            }
        }
    }
}
