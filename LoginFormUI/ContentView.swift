//
//  ContentView.swift
//  LoginFormUI
//
//  Created by Sreytouch(Jessica) on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUserName = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("UserName", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUserName))
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUserName))
                    Button("Login"){
                        // Authenticate User
                        authenticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("You are loggin @\(username)"), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
    func authenticateUser(username: String, password: String){
        if username.lowercased() == "jessica" {
            wrongUserName = 0
            if password.lowercased() == "123" {
                wrongUserName = 0
                showingLoginScreen = true
            } else {
                wrongUserName = 2
            }
        } else {
            wrongUserName = 2
        }
    }
}

#Preview {
    ContentView()
}
