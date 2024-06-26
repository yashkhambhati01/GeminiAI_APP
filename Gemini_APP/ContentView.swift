//
//  ContentView.swift
//  Gemini_APP
//
//  Created by R93 on 05/06/24.
//

import GoogleGenerativeAI
import SwiftUI

struct ContentView: View {
    let model = GenerativeModel(name: "gemini-pro", apiKey: APIKey.default)
    
    @State var userPrompt = ""
    @State var userName = ""
    @State var arr = [UserData]()
    @State var response = ""
    @State var isLoading = false
    @State var searchHistory = [SearchEntry]()
    @State private var isActive = false
    @State private var isActive2 = false
    var temp = 0
    var body: some View {
        NavigationView {
            VStack {
                Text("WelCome 🙌🏻")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.indigo)
                    .padding(.trailing, 190)
                    .padding(.top, 40)
                Text("How Can I Help You ?")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                    .padding(.trailing, 80)
                HStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 170 , height: 70)
                            .cornerRadius(8)
                            .padding(.trailing, 10)
                            .foregroundColor(.blue)
                            .shadow(radius: 6)
                        ZStack {
                            Text("learn About Us")
                                .font(.system(size: 12))
                                .bold()
                                .foregroundColor(.white)
                            Button(action: {
                                isActive = true
                            }, label: {
                                Image(systemName: "arrowshape.forward.fill")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                    .foregroundColor(.white)
                                    .padding(.leading, 120)
                            })
                        }
                        .padding(.leading , -35)
                        .padding(.trailing)
                        .padding(.top)
                        
                        NavigationLink(destination: LearnAboutUsView(), isActive: $isActive) {
                            EmptyView()
                        }
                    }
                    ZStack {
                        Rectangle()
                            .frame(width: 170 , height: 70)
                            .cornerRadius(8)
                            .padding(.trailing, 0)
                            .foregroundColor(.blue)
                            .shadow(radius: 6)
                        ZStack {
                            Text("Search History")
                                .font(.system(size: 12))
                                .bold()
                                .foregroundColor(.white)
                            Button(action: {
                                isActive2 = true
                            }, label: {
                                Image(systemName: "arrowshape.forward.fill")
                                    .resizable()
                                    .frame(width: 16,height: 16)
                                    .foregroundColor(.white)
                                    .padding(.leading, 120)
                            })
                        }
                        .padding(.leading , -20)
                        .padding(.trailing)
                        .padding(.top)
                        
                        NavigationLink(destination: HistoryView(searchHistory: $searchHistory), isActive: $isActive2) {
                            EmptyView()
                        }
                    }
                }
                Rectangle()
                    .frame(width: 330,height: 1)
                    .foregroundColor(.gray)
                    .padding()
                
                ZStack {
                    ScrollView {
                        Text(response)
                            .padding()
                    }
                    if isLoading{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                    }
                }
                HStack {
                    TextField("Ask Anything", text: $userPrompt)
                        .lineLimit(3)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(20)
                        .disableAutocorrection(true)
                    
                    Button(action: {
                        generateResponse()
                    }, label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 70,height: 50)
                                .cornerRadius(20)
                            Text("send")
                                .foregroundColor(.white)
                                .bold()
                        }
                        
                    })
                }
                Text("Created by Yash Khambhati ❤️")
                    .font(.system(size: 12))
            }
            .onAppear(){
                SqliteHelper.getData()
                arr = SqliteHelper.userArray
                print(arr)
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
    func generateResponse() {
        isLoading = true
        response = ""
        
        Task {
            do {
                let result = try await model.generateContent(userPrompt)
                isLoading = false
                let newResponse = result.text ?? "No Response Found"
                response = newResponse
                
                
                let entry = SearchEntry(prompt: userPrompt, response: newResponse, date: Date())
                searchHistory.append(entry)
                userPrompt = ""
                
            } catch {
                isLoading = false
                response = "Something Went Wrong: \(error.localizedDescription)"
            }
        }
    }
}

struct SearchEntry: Identifiable {
    let id = UUID()
    let prompt: String
    let response: String
    let date: Date
}

#Preview {
    ContentView()
}
