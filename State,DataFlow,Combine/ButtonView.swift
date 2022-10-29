//
//  ButtonView.swift
//  State,DataFlow,Combine
//
//  Created by Александр on 29.10.2022.
//

import SwiftUI

struct ButtonView: View {
    
    let text: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "Text", color: .blue, action: {})
    }
}
