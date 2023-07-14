//
//  SwiftUIView.swift
//  AsyncAwait
//
//  Created by Dilshad N on 07/08/22.
//

import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var isFetching = false
    @Published var courses = [Course]()
    @Published var errorMessage: String = ""
    
    init() {
    }
    
    @MainActor
    func fetchData() async {
        
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else { return }
        
        do {
            isFetching = true
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            if let res = response as? HTTPURLResponse, res.statusCode >= 300 {
                self.errorMessage = "Failed to hit endpoint with bad status code"
                
            }
            self.courses = try JSONDecoder().decode([Course].self, from: data)
            isFetching = false
            
        } catch {
            isFetching = false
            print("Failed to load \(error)")
        }
    }
}

