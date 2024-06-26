//
//  LearnAboutUsView.swift
//  Gemini_APP
//
//  Created by R93 on 12/06/24.
//

import SwiftUI

struct LearnAboutUsView: View {
    var body: some View {
        VStack {
            Text("If you don't have an idea how to use Gemini AI and what to ask, And to ask your own question, go to the message box labeled as Enter a prompt here at the bottom.")
                .padding(10)
            Text("Once you enter your query,you'll get a generated response in seconds. Now, you have options to respond in multiple ways.")
                .padding(10)
            Text("Gemini will start analyzing your message and        generate the most relevant response.")
                .padding(10)
        }
        Text("Some Tips")
            .bold()
        
        ScrollView{
            Text("Write Simple, Clear and Concise Query")
                .bold()
            Text("It's very important to understand that when you're using Google BGeminiard, you need to provide a very simple, clear, and concise query or prompt that Google Gemini easily understands. Try to make it to the point. For example - ,Write a poem on a cow or Turn this paragraph into points.")
                .padding()
            Text("Provide Good Enough Information and Facts")
                .bold()
            Text("If you want the most relevant response, then you need to provide as much information and facts as possible during your query. Give references, examples, and facts with your query to let Gemini understand properly and give relevant responses.")
                .padding()
            Text("Turn Data in a Table Format")
                .bold()
            Text("You can ask Google Gemini to turn the raw data into a tabular format for easy readability. Just write a prompt: Turn this raw data into table format.")
                .padding()
            Text("Fast-check Generated Response")
                .bold()
            Text("If you want the most accurate and relevant results, then you can fast-check the generated response by clicking on the Google icon and checking its original sources for the given information.")
                .padding()
            Text("Ask Follow-up Questions")
                .bold()
            Text("Sometimes, there's a question left regarding the generated response, so it's better to ask follow-up questions and come up with satisfactory answers. You can continue the conversation with Gemini by asking questions until you reach satisfaction.")
                .padding()
        }
        .navigationTitle("How To Use Gemini")
    }
}

#Preview {
    LearnAboutUsView()
}
