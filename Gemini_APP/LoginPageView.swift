//
//  LoginPageView.swift
//  Gemini_APP
//
//  Created by R93 on 06/06/24.
//

import SwiftUI

struct LoginPageView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var isFocused = false
    @State private var isFocused2 = false
    @State private var isActive = false
    @State private var isActive2 = false
    @State var arr = [UserData]()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack{
                    Image("Gemini_LOGO")
                        .resizable()
                        .frame(width: 300,height: 220)
                    Text("Gemini AI For You")
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("Email")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .offset(y: isFocused || !email.isEmpty ? -50 : 0)
                                .scaleEffect(isFocused || !email.isEmpty ? 0.8 : 1.0, anchor: .leading)
                                .animation(.easeInOut(duration: 0.25), value: isFocused || !email.isEmpty)
                                .padding(.leading)
                            TextField("", text: $email, onEditingChanged: { focused in
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
                        .padding(.top, 00)
                    }
                    .onAppear(){
                        SqliteHelper.CreateFile()
                    }
                    .padding()
                    VStack {
                        ZStack(alignment: .leading) {
                            Text("Password")
                                .font(.system(size: 16))
                                .foregroundColor(.black)
                                .offset(y: isFocused2 || !password.isEmpty ? -50 : 0)
                                .scaleEffect(isFocused2 || !password.isEmpty ? 0.8 : 1.0, anchor: .leading)
                                .animation(.easeInOut(duration: 0.25), value: isFocused2 || !password.isEmpty)
                                .padding(.leading)
                            TextField("", text: $password, onEditingChanged: { focused in
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
                        .padding(.top, 0)
                    }
                }
                Spacer()
                ZStack {
                    Button(action: {
                        if email.isEmpty && password.isEmpty {
                            print("Email And Password are empty...")
                        } else {
                            let isAuthenticated = arr.contains {
                                $0.email == email && $0.password == password
                            }
                            if isAuthenticated {
                                isActive = true
                            } else {
                                
                            }
                        }
                    }, label: {
                        Text("Login")
                            .foregroundStyle(Color.white)
                            .frame(width: 350,height: 50)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .padding()
                    })
                }
                NavigationLink(destination: ContentView(), isActive: $isActive) {
                    EmptyView()
                }
                Button(action: {
                    isActive2 = true
                }, label: {
                    Text("I Don't Have Account Of Gemini AI")
                        .font(.system(size: 12))
                        .foregroundStyle(.black)
                })
                NavigationLink(destination: RegisterAccountView(),isActive: $isActive2) {
                    EmptyView()
                }
            }
            .onAppear(){
                SqliteHelper.getData()
                arr = SqliteHelper.userArray
                print(arr)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    LoginPageView()
}
