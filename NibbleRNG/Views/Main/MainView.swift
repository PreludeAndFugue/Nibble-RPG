//
//  ContentView3.swift
//  NibbleRNG
//
//  Created by gary on 16/01/2021.
//

import SwiftUI


struct MainView: View {
    @ObservedObject var model = MainViewModel()

    var body: some View {
        ZStack(alignment: .topLeading) {
            HStack {
                Button(action: model.choosePeople) {
                    Image(systemName: "person.3.fill")
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(16)

                Spacer()
            }
            .padding()

            VStack {
                Spacer()

                ZStack {
                    ForEach(model.people) { person in
                        PersonView(person: person.person)
                            .rotation3DEffect(
                                Angle(degrees: model.degrees(for: person)),
                                axis: (x: 4, y: 0, z: 0),
                                anchor: .center,
                                anchorZ: 200,
                                perspective: -0.3
                            )
                            .animation(Animation.easeOut(duration: 2.5))
                            .zIndex(model.zIndex(for: person))
                    }
                    .id(model.uuid)
                }

                Spacer()

    //            Slider(value: $angle, in: 0...360)
                Button(action: model.run) {
                    Text("Go!")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(16)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $model.showSettings) {
            ChoosePeopleView(selected: model.selectedPeople, action: model.updatePeople(_:))
        }
    }
}


// MARK: - Preview

#if DEBUG
struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
