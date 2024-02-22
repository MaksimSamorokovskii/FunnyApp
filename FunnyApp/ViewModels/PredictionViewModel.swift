//
//  PredictionViewModel.swift
//  FunnyApp
//
//  Created by Максим Самороковский on 19.02.2024.
//

import SwiftUI

class PredictionViewModel: ObservableObject {
    @Published var meme: Meme?
    @Published var predictionFetched = false
    
    func fetchMemePrediction() {
        NetworkManager.fetchMemes { result in
            switch result {
            case .success(let memes):
                DispatchQueue.main.async {
                    self.meme = memes.randomElement()
                    self.predictionFetched = true
                }
            case .failure(let error):
                print("Error fetching memes: \(error)")
            }
        }
    }
}
