//
//  HIstoryView.swift
//  Gemini_APP
//
//  Created by R93 on 05/06/24.
//

import SwiftUI

struct HistoryView: View {
    @Binding var searchHistory: [SearchEntry]
    
    var body: some View {
        List(searchHistory) { entry in
            VStack(alignment: .leading) {
                Text(entry.prompt)
                    .font(.headline)
                Text(entry.date, style: .date)
                    .font(.caption)
            }
            .padding(.vertical, 4)
        }
        .navigationTitle("Search History")
    }
}
