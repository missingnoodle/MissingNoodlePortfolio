//
//  ItemRowView.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/9/21.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item
    @StateObject var viewModel: ViewModel

    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            Label {
                Text(item.itemTitle)
            } icon: {
                Image(systemName: viewModel.icon)
                    .foregroundColor(viewModel.color.map { Color($0) } ?? .clear)
            }
        }
        .accessibilityLabel(viewModel.label)
    }

    init(project: Project, item: Item) {
        let viewModel = ViewModel(project: project, item: item)
        _viewModel = StateObject(wrappedValue: viewModel)

        self.item  = item
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(project: Project.example, item: Item.example)
    }
}
