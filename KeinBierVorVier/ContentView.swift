//
//  ContentView.swift
//  KeinBierVorVier
//
//  Created by Lang, Stefan [RTL Tech] on 09.08.24.
//

import SwiftUI

struct ContentView: View {

    @StateObject
    private var viewModel = ContenViewModel()

    var body: some View {

        HStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .canDrink:
                Text("Klar, gönn dir!")
                    .bold()
            case .cannotDrink:
                VStack {
                    Text("Dauert noch :(")
                        .bold()

                    Spacer().frame(height: 48)

                    Button("Versuchs noch mal") {
                        Task {
                            await viewModel.checkCanDrink()
                        }
                    }
                }
            }
        }.background()
        .task {
            await viewModel.checkCanDrink()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
