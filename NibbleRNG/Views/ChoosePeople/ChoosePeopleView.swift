//
//  ChoosePeopleView.swift
//  NibbleRNG
//
//  Created by gary on 21/03/2021.
//

import SwiftUI

struct ChoosePeopleView: View {
    @ObservedObject var model = ChoosePeopleVM()


    init(selected: [Person], action: @escaping ChoosePeopleVM.Action) {
        model.update(selected: selected, action: action)
    }


    var body: some View {
        List {
            ForEach(People.people) { person in
                Button(action: { model.select(person) }) {
                    HStack {
                        person.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 80)
                        Text(person.name)
                            .font(.system(.title, design: .rounded))
                        Spacer()
                        if model.isSelected(person) {
                            Image(systemName: "checkmark")
                                .foregroundColor(.orange)
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                        }
                    }
                }
            }
        }
    }
}


// MARK: - Preview

#if DEBUG
struct ChoosePeopleView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePeopleView(selected: [], action: { _ in })
    }
}
#endif
