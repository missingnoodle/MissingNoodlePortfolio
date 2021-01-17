//
//  Binding-OnChange.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/9/21.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
