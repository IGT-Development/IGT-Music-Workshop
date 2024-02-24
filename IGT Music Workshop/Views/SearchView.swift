//
//  SearchView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation
import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack (spacing: 16) {
                    Text("Потеряли поиск, ищем :)")
                        .navigationBarTitle("Поиск", displayMode: .inline)
                }
                .padding()
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())

    }
}
