//
//  ContentView.swift
//  FunnyApp
//
//  Created by Максим Самороковский on 19.02.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = PredictionViewModel()
    @State private var question = ""
    @State private var showPrediction = false

    var body: some View {
        VStack {
            TextField("Enter your question", text: $question)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Get a prediction") {
                UIApplication.shared.endEditing()
                viewModel.fetchMemePrediction()
                showPrediction = true
            }
            .padding()
            .background(.yellow.opacity(0.6))
            .clipShape(Capsule())
            .disabled(question.isEmpty)
        }
        .padding()
        .sheet(isPresented: $showPrediction) {
            PredictionView(viewModel: viewModel, isPresented: $showPrediction)
                .onDisappear {
                    question = ""
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

