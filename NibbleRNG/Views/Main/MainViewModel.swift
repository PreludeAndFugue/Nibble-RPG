//
//  MainViewModel.swift
//  NibbleRNG
//
//  Created by gary on 21/03/2021.
//

import Combine
import SwiftUI

class MainViewModel: ObservableObject {
    struct NumberedPerson {
        let n: Int
        let person: Person
    }

    @Published var people = createPeople()
    @Published var showSettings = false
    @Published private var _angle = 0.0
    
    private var diff: Double {
        360.0 / Double(count)
    }


    var uuid = UUID()


    var count: Int {
        people.count
    }


    var selectedPeople: [Person] {
        people.map({ $0.person })
    }


    func run() {
        let c = count == 0 ? 1 : count
        let p = Double(Int.random(in: 0..<c))
        let a = p * (360.0 / Double(c))
        SwiftUI.withAnimation {
            _angle += 1440 + a
        }
    }


    func choosePeople() {
        showSettings.toggle()
    }


    func updatePeople(_ people: [Person]) {
        // Updating the UUID will reload the list without animation
        // https://stackoverflow.com/q/59013217/132767
        uuid = UUID()
        _angle = 0
        self.people = people.enumerated().map({ NumberedPerson(n: $0.offset, person: $0.element)})
    }


    func degrees(for person: NumberedPerson) -> Double {
        _angle + Double(person.n) * diff
    }


    /// The `PersonView`s are displayed inside a ZStack. The default
    /// z-index of each View is determined by the order they are added
    /// to the ZStack. So have to update the z-indexes to make sure
    /// that the "front" View appears in front of other Views.
    ///
    /// - Parameter angle: the angle of the View.
    /// - Returns: The updated z-index.
    func zIndex(for person: NumberedPerson) -> Double {
        let a = _angle + Double(person.n) * diff
        switch a.truncatingRemainder(dividingBy: 360) {
        case 0..<51:
            return 5
        case 51..<102:
            return 4
        case 102..<153:
            return -1
        case 153..<204:
            return -2
        case 204..<255:
            return -1
        case 255..<306:
            return 4
        case 306...360:
            return 5
        default:
            return 10
        }
    }
}


// MARK: - NumberedPerson

extension MainViewModel.NumberedPerson: Identifiable {
    var id: Int {
        n
    }
}


// MARK: - Private

private extension MainViewModel {
    static func createPeople() -> [NumberedPerson] {
        People.people.enumerated().map({ NumberedPerson(n: $0.offset, person: $0.element) })
    }
}
