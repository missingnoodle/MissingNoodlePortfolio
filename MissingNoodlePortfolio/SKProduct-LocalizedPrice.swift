//
//  SKProduct-LocalizedPrice.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 4/11/21.
//

import StoreKit

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price) ?? "0.00"
    }
}
