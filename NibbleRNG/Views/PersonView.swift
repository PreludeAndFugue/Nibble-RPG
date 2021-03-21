//
//  PersonView.swift
//  NibbleRNG
//
//  Created by gary on 16/01/2021.
//

import SwiftUI

struct PersonView: View {
    let person: Person

    var body: some View {
        ZStack(alignment: .bottom) {
            person.image
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(person.name)
                .font(.system(.title, design: .rounded))
                .foregroundColor(.white)
                .padding(5)
                .shadow(color: .black, radius: 5, x: 2, y: 2)
        }
        .frame(width: 150, height: 130)
        .background(Color.random())
        .cornerRadius(20)
    }
}


// MARK: - Private

private extension Color {
    static let colours: [Color] = [
        .blue, .green, .red, .yellow, .pink, .purple, .orange
    ]


    static func random() -> Color {
        colours.randomElement()!
    }
}


#if DEBUG
struct PersonView_Previews: PreviewProvider {
    private static let person = Person(
        id: 1,
        name: "Andreas",
        imageName: "andreas"
    )
    static var previews: some View {
        PersonView(person: person)
    }
}
#endif
