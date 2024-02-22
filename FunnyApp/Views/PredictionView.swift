//
//  PredictionView.swift
//  FunnyApp
//
//  Created by Максим Самороковский on 19.02.2024.
//

import SwiftUI

struct PredictionView: View {
    @ObservedObject var viewModel: PredictionViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            if let meme = viewModel.meme {
                AsyncImage(url: URL(string: meme.url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 450)
                } placeholder: {
                    ProgressView()
                }
                
                .padding()
                
                HStack {
                    Button("👍") {
                        viewModel.meme = nil
                        viewModel.fetchMemePrediction()
                        isPresented = false
                        
                    }
                    .padding()
                    .background(.blue)
                    .clipShape(Circle())
                    
                    Button("👎") {
                        
                        viewModel.fetchMemePrediction()
                        
                    }
                    .padding()
                    .background(.blue)
                    .clipShape(Circle())
                }
            } else {
                ProgressView()
            }
        }
        .navigationTitle("Predection")
    }
}
