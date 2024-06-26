//
//  GeneratorViewModel.swift
//  Gemini_APP
//
//  Created by R93 on 11/06/24.
//

import Foundation
import OpenAIKit

extension ImageGenerateView {
    class ViewModel : ObservableObject {
        @Published var duration = 0
        @Published var image : URL?
        
        let prompt : String
        let selectedStyle: ImageStyle
        
        init(prompt: String, selectedStyle: ImageStyle) {
            self.prompt = prompt
            self.selectedStyle = selectedStyle
        }
        
        func generateImage(){
            let formattedPrompt = "\(selectedStyle) image of \(prompt)"
        }
    }
}

