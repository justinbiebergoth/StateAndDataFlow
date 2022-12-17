//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @AppStorage("user") var userName = ""
    @AppStorage("isRegistered") var isRegistered = false
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(.leading, 35)
                CounterView(name: $name)
                    .foregroundColor(name.count < 3 ? .red : .green)
            }
            .padding()
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled( name.count < 3)
            }
        }
    }
    
    private func registerUser() {
        userName = name
        isRegistered.toggle()
        
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

    
    init(name: Binding<String>) {
        self._name = name
        counter = _name.wrappedValue.count
    }
    
    var body: some View {
        Text("\(counter)")

    }
}
