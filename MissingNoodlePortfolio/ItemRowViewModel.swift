//
//  ItemRowViewModel.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 3/13/21.
//

import Foundation

extension ItemRowView {
    class ViewModel: ObservableObject {
        var project: Project
        var item: Item

        var title: String {
            item.itemTitle
        }

        init(project: Project, item: Item) {
            self.project = project
            self.item = item
        }

        var icon: String {
            if item.completed {
                return "checkmark.circle"
            } else if item.priority == 3 {
                return "exclamationmark.triangle"
            } else {
                return "checkmark.circle"
            }
        }

        var color: String? {
            if item.completed {
                return project.projectColor
            } else if item.priority == 3 {
                return project.projectColor
            } else {
                return nil
            }
        }

        var label: String {
            if item.completed {
                return "\(item.itemTitle), completed."
            } else if item.priority == 3 {
                return "\(item.itemTitle), high priority."
            } else {
                return "\(item.itemTitle)"
            }
        }
    }
}
