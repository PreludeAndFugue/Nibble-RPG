//
//  People.swift
//  NibbleRNG
//
//  Created by gary on 16/01/2021.
//

import SwiftUI

struct Person: Identifiable, Hashable {
    let id: Int
    let name: String
    let imageName: String

    var image: Image {
        return Image(imageName)
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}



struct People {
    static let count = people.count
    
    static let people: [Person] = [
        Person(id: 0, name: "Andreas", imageName: "andreas"),
        Person(id: 1, name: "David", imageName: "david"),
        Person(id: 2, name: "Gary", imageName: "gary"),
        Person(id: 3, name: "Graeme", imageName: "graeme"),
        Person(id: 4, name: "Igor", imageName: "igor"),
        Person(id: 5, name: "Shea", imageName: "shea"),
        Person(id: 6, name: "Úna", imageName: "una"),
    ]
}
