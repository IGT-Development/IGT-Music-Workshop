//
//  HomeView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            ScrollView {
                VStack (spacing: 16) {
                    Text("Главная на распаковке :3")
                        .navigationBarTitle("Главная", displayMode: .inline)
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AuroraView())
    }
}
