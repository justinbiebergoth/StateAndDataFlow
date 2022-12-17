//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.12.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimeCounter()
//    @EnvironmentObject private var userManager: UserManager
    @State var logout = false
    
    @AppStorage("user") var userName: String?
    @AppStorage("isRegistered") var isRegistered: Bool?
    
    var body: some View {
        if (logout) {
            RegisterView()
        } else {
            VStack {
                Text("Hi, \(userName ?? "")")
                    .font(.largeTitle)
                    .padding(.top, 100)
                Text(timer.counter.formatted())
                    .font(.largeTitle)
                    .padding(.top, 100)
                Spacer()
                
                ButtonView(timer: timer)
                
                Spacer()
                
                Button(action: logOut) {
                    Text("Log Out")
                }
            }
        }
        
        }
    private func logOut() {
        self.logout = true
        self.isRegistered?.toggle()
        self.userName = ""
    }
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
