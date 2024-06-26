//
//  RegisterAccountView.swift
//  Gemini_APP
//
//  Created by R93 on 18/06/24.
//

import SwiftUI

struct RegisterAccountView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var isFocused = false
    @State private var isFocused2 = false
    @State private var isFocused3 = false
    @State private var isActive = false
    @State private var isActive2 = false
    
    var body: some View {
        VStack{
            Image("Gemini_LOGO")
                .resizable()
                .frame(width: 300,height: 225)
            VStack {
                ZStack(alignment: .leading) {
                    Text("Username")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .offset(y: isFocused3 || !username.isEmpty ? -50 : 0)
                        .scaleEffect(isFocused3 || !username.isEmpty ? 0.8 : 1.0, anchor: .leading)
                        .animation(.easeInOut(duration: 0.25), value: isFocused3 || !password.isEmpty)
                        .padding(.leading)
                    TextField("", text: $username, onEditingChanged: { focused in
                        isFocused3 = focused
                    })
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .frame(width: 350)
                    .cornerRadius(10)
                    .onTapGesture {
                        isFocused3 = true
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            VStack {
                ZStack(alignment: .leading) {
                    Text("Email")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .offset(y: isFocused2 || !email.isEmpty ? -50 : 0)
                        .scaleEffect(isFocused2 || !email.isEmpty ? 0.8 : 1.0, anchor: .leading)
                        .animation(.easeInOut(duration: 0.25), value: isFocused2 || !email.isEmpty)
                        .padding(.leading)
                    TextField("", text: $email, onEditingChanged: { focused in
                        isFocused2 = focused
                    })
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .frame(width: 350)
                    .cornerRadius(10)
                    .onTapGesture {
                        isFocused2 = true
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            VStack {
                ZStack(alignment: .leading) {
                    Text("Password")
                        .font(.system(size: 16))
                        .foregroundColor(.black)
                        .offset(y: isFocused || !password.isEmpty ? -50 : 0)
                        .scaleEffect(isFocused || !password.isEmpty ? 0.8 : 1.0, anchor: .leading)
                        .animation(.easeInOut(duration: 0.25), value: isFocused || !password.isEmpty)
                        .padding(.leading)
                    TextField("", text: $password, onEditingChanged: { focused in
                        isFocused = focused
                    })
                    .padding()
                    .background(Color.gray.opacity(0.25))
                    .frame(width: 350)
                    .cornerRadius(10)
                    .onTapGesture {
                        isFocused = true
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
            Spacer()
            Button(action: {
                if email.isEmpty && password.isEmpty {
                    
                } else {
                    SqliteHelper.addData(email: email, password: password)
                    isActive = true
                }
            }, label: {
                Text("Login")
                    .foregroundStyle(Color.white)
                    .frame(width: 350,height: 50)
                    .background(Color.black.opacity(0.8))
                    .cornerRadius(10)
                    .padding()
            })
            NavigationLink(destination: LoginPageView(),isActive: $isActive) {
                EmptyView()
            }
        }
    }
}

#Preview {
    RegisterAccountView()
}
