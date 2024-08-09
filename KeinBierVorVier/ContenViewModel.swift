//
//  ContenViewModel.swift
//  KeinBierVorVier
//
//  Created by Lang, Stefan [RTL Tech] on 09.08.24.
//

import Foundation

class ContenViewModel: ObservableObject {
    enum State {
        case loading
        case canDrink
        case cannotDrink
    }

    @Published private (set) var state: State = .loading

    func checkCanDrink(currentDate: Date = Date()) async {
        DispatchQueue.main.async {
            self.state = .loading
        }

        try? await Task.sleep(for: .seconds(1.5))
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: currentDate)

        DispatchQueue.main.async {
            if hour >= 16 {
                self.state = .canDrink
            } else {
                self.state = .cannotDrink
            }
        }
    }
}
