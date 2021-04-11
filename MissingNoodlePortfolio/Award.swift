//
//  Award.swift
//  MissingNoodlePortfolio
//
//  Created by Tami Black on 1/30/21.
//

import Foundation

struct Award: Decodable, Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let color: String
    let criterion: String
    let value: Int
    let image: String

    static let allAwards = Bundle.main.decode([Award].self, from: "Awards.json", fromBundleWithClass: DataController.self)
    static let example = allAwards[0]
}
