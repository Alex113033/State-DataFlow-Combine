//
//  ContentView.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userManager: UserManager
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            VStack {
                Text("time left: \(timer.counter)")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .offset(x: 0, y: 200)
                Spacer()
                ButtonView(text: timer.buttonTitle, color: .green) {
                    timer.startTimer()
                }
            }
            VStack {
                Text("Hi, \(userManager.user.name)")
                    .font(.largeTitle)
                    .offset(x: 0, y: 100)
                Text("now come back")
                    .font(.largeTitle)
                    .offset(x: 0, y: 150)
                Spacer()
                ButtonView(text: "Back", color: .red) {
                    userManager.user.isRegister.toggle()
                    DataManager.shared.delete(userManager: userManager)
                }
                .font(.title)
                .padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}

