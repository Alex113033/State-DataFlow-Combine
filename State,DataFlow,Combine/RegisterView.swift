//
//  RegisterView.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            VStack {
                Text("Characters: \(name.count)")
                    .padding(.trailing)
                    .foregroundColor(
                        name.count < 3 ? .red : .green
                    )
                HStack{
                    TextField("Enter your name...", text: $name)
                        .frame(width: 270.0, height: 50.0)
                        .multilineTextAlignment(.center)
                        .border(/*@START_MENU_TOKEN@*/Color.gray/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    
                    
                    Image(systemName: name.count < 3
                          ? ""
                          : "checkmark.circle.fill"
                    )
                    .foregroundColor(.green)
                }
            }
            Button(action: registerUser) {
                Text("Timer")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(
                        name.count < 3 ? .red : .green
                    )
            }
        }
    }
}


extension RegisterView {
    private func registerUser() {
        if name.count > 2 {
            userManager.user.name = name
            userManager.user.isRegister.toggle()
            DataManager.shared.save(user: userManager.user)
            
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
