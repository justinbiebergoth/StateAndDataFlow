//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var userManager: UserManager
//    @AppStorage(userManager.name) var name = ""
//    @State private var isValid = false
//    
//    @State private var isVisible = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                CounterView(name: $name)
            }
            .padding()
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled( $name.wrappedValue.count < 3)
            }
        }
    }
    
    private func registerUser() {
            userManager.name = name
//            userManager.name = user
            userManager.isRegister.toggle()
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct CounterView: View {
    @Binding var name: String
    var counter = 0
    var color = Color(.red)
    
    init(name: Binding<String>) {
        self._name = name
        counter = _name.wrappedValue.count
        if counter > 2 {
            color = .green
        }
    }
    
    var body: some View {
        Text("\(counter)")
            .foregroundColor(color)
    }
}
