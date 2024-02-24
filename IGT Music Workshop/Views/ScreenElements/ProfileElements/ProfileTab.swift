//
//  ScreenElements.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 24.02.2024.
//

import Foundation
import SwiftUI


struct ProfileTab: View {
    
    private var email = "Cherednik_01@bk.ru"
    private var login = "Kayllen_ZzZ"
    
    var body: some View {
        HStack(spacing: 16) {
            Image("TestProfileImage")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .clipped()
                .cornerRadius(100)
            VStack (alignment: .leading) {
                Text(login)
                    .font(.largeTitle)
                    .bold()
                Text(email)
                    .foregroundColor(.white.opacity(0.6))
                Button(action: {
                    
                }
                ){
                    Text("Редактировать профиль")
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}
