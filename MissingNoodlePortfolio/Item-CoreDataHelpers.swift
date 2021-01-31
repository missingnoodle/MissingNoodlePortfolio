//
//  Item-CoreDataHelpers.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/3/21.
//

import Foundation

extension Item {
    enum SortOrder {
        case optimized,
             title,
             creationDate
    }

    var itemTitle: String {
        title ?? "New Item"
    }

    var itemDetail: String {
        detail ?? ""
    }

    var itemCreationDate: Date {
        creationDate ?? Date()
    }

    static var example: Item {
        let controller = CoreDataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let item = Item(context: viewContext)
        item.title = "Example Item"
        item.detail = "This is an example item"
        item.priority = 3
        item.creationDate = Date()
        return item
    }
}
