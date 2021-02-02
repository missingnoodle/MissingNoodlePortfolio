// : [Previous](@previous)

import Combine
import MNNetworking
import PlaygroundSupport
import SwiftUI

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution

struct User: Decodable {
    var id: UUID
    var name: String

    static let `default` = User(id: UUID(), name: "Anonymous")
}

let url = URL(string: "https://www.hackingwithswift.com/samples/user-24601.json")!
let request = MNNetworkAPIClient<User>(url)

request.fetch(User.default) {
    print($0.name)
}

// : [Next](@next)
