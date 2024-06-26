//
//  APIKey.swift
//  Gemini_APP
//
//  Created by R93 on 05/06/24.
//

import Foundation

enum APIKey {
  static var `default`: String {
    guard let filePath = Bundle.main.path(forResource: "GenerativeAI-info", ofType: "plist")
    else {
      fatalError("Couldn't find file 'GenerativeAI-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "API_KEY") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'GenerativeAI-Info.plist'.")
    }
    if value.starts(with: "_") {
      fatalError(
        "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
      )
    }
    return value
  }
}

