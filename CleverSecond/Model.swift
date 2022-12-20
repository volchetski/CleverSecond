//
//  Model.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 20.12.22.
//

import Foundation

struct Item {
    let itemName = "Title"
    let itemDescription = "Description"
    let imageName: String
}

extension Item {
    static func getItem() -> [Item] {
        [
            Item(imageName: "account"),
            Item(imageName: "bolt"),
            Item(imageName: "contactless"),
            Item(imageName: "event"),
            Item(imageName: "language"),
            Item(imageName: "nightlight"),
            Item(imageName: "paid"),
            Item(imageName: "perm"),
            Item(imageName: "settings"),
            Item(imageName: "verified")
        ]
    }
}
