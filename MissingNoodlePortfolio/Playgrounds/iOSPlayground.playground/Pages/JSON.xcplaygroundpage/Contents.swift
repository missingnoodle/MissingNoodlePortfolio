// : [Previous](@previous)

import Foundation
import MNNetworking

let json = """
[
    {
        "name": "Taylor Swift",
        "company": "Taytay Inc",
        "age": 26,
        "address": {
            "street": "555 Taylor Swift Avenue",
            "city": "Nashville",
            "state": "Tennessee",
            "gps": {
                "lat": 36.1868667,
                "lon": -87.0661223
            }
        }
    },
    {
        "title": "1989",
        "type": "studio",
        "year": "2014",
        "singles": 7
    },
    {
        "title": "Shake it Off",
        "awards": 10,
        "hasVideo": true
    }
]
"""

let data = Data(json.utf8)

// Not ideal...
print("Not ideal way to Parse JSON")
if let objects = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
    for object in objects {
        if let title = object["title"] as? String {
            print(title)
        }
    }
}

// Slightly Cleaner
print("\nSlightly Cleaner way to Parse JSON")
extension Dictionary where Key == String {
    func bool(for key: String) -> Bool? {
        self[key] as? Bool
    }

    func double(for key: String) -> Double? {
        self[key] as? Double
    }

    func int(for key: String) -> Int? {
        self[key] as? Int
    }

    func string(for key: String) -> String? {
        self[key] as? String
    }
}

if let objects = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
    for object in objects {
        if let title = object.string(for: "title") {
            print(title)
        } else {
            print("title is nil")
        }
    }
}

print("\nUsing our JSON Struct to Parse JSON")
// Using our JSON Struct
let jsonObject = try JSON(string: json)

for item in jsonObject {
    print("title as string: \(item["title"].string)")
    print("title optionalString: \(item["title"].optionalString ?? "")")
    print(item["address"]["city"].string)

    if let latitude = item["address"]["gps"]["lat"].optionalDouble {
        print("Latitude is \(latitude)")
    }

    // with the simple add of @dynamicMemberLookup and
    // subscript(dynamicMember key: String) -> JSON {
    //     optionalDictionary?[key] ?? JSON(value: nil)
    // }

    if let longitude = item.address.gps.lon.optionalDouble {
        print("Longitude is \(longitude)")
    }
}

// : [Next](@next)
