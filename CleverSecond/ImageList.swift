//
//  ImageList.swift
//  CleverSecond
//
//  Created by Евгений Волчецкий on 19.12.22.
//

import Foundation

struct ImageList {
    let name: String
}

extension ImageList {
    static func getImageList() -> [ImageList] {
        [
        ImageList(name: "account"),
        ImageList(name: "bolt"),
        ImageList(name: "contactless"),
        ImageList(name: "event"),
        ImageList(name: "language"),
        ImageList(name: "nightlight"),
        ImageList(name: "paid"),
        ImageList(name: "perm"),
        ImageList(name: "settings"),
        ImageList(name: "verified")
        ]
    }
}
