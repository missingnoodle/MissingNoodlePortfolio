//
//  UnlockView.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 4/11/21.
//

import StoreKit
import SwiftUI

struct UnlockView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var unlockManager: UnlockManager

    var body: some View {
        VStack {
            switch unlockManager.requestState {
            case .loaded(let product):
                ProductView(product: product)

            case .failed(_):
                Text("Sorry, there was an error loading the store. Please try again later.")

            case .loading:
                ProgressView("Loading...")

            case .purchased:
                Text("Thank you!")

            case .deferred:
                Text("Thank you! You request is pending approval, but you can continue using the app in the meantime.")
            }
        }
        .padding()
        .onReceive(unlockManager.$requestState) { value in
            if case .purchased = value {
                dismiss()
            }
        }
    }

    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
