//
//  ChoosePeopleVM.swift
//  NibbleRNG
//
//  Created by gary on 21/03/2021.
//

import Combine

final class ChoosePeopleVM: ObservableObject {
    typealias Action = ([Person]) -> Void

    let allPeople = People.allPeople
    @Published var selectedPeople: Set<Person> = []

    private var action: Action?

    func update(selected: [Person], action: @escaping Action) {
        selectedPeople = Set(selected)
        self.action = action
    }


    func isSelected(_ person: Person) -> Bool {
        selectedPeople.contains(person)
    }


    func select(_ person: Person) {
        if selectedPeople.contains(person) {
            selectedPeople.remove(person)
        } else {
            selectedPeople.insert(person)
        }
        action?(Array(selectedPeople).sorted(by: { $0.id < $1.id }))
    }
}
