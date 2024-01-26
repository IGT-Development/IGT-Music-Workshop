//
//  LoginView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 26.01.2024.
//

import Foundation
import SwiftUI



struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRegistrationActive: Bool = false
    @State private var startAnimation: Bool = false
    //@State private var animateGradient: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Text("IGT \nMUSIC WORKSHOP")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.accentColor)
                    Spacer()
                    VStack{
                        Text("Вход")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.bottom, 16)
                        TextField("", text: $username, prompt: Text("Имя пользователя").foregroundColor(.white))
                            .multilineTextAlignment(.center)
                            .font(.title3)
                            .bold()
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(8)
                            .padding(.bottom, 8)
                        SecureField("", text: $password, prompt: Text("Пароль").foregroundColor(.white))
                            .multilineTextAlignment(.center)
                            .font(.title3)
                            .bold()
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(8)
                            .padding(.bottom, 8)
                        Button(action: {
                            // Действие при нажатии на кнопку
                        }) {
                            Text("Войти")
                                .padding(16)
                                .foregroundColor(.white)
                                .bold()
                                .font(.title3)
                                .frame(maxWidth: .infinity)
                                .background(Color.accentColor)
                                .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.bottom, 16)
                        HStack {
                            Text("Нет аккаунта?")
                                .foregroundColor(.white)
                            NavigationLink(
                                destination: RegistrationView(),
                                isActive: $isRegistrationActive,
                                label: {
                                    Text("Зарегистрируйтесь!")
                                        .foregroundColor(.accentColor)
                                }
                            )
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
            .background(AuroraView())
        }
    }
}


struct RegistrationView: View {
    var body: some View {
        ZStack{
            ZStack {
                Text("IGT \nMUSIC WORKSHOP")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.accentColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .background(AuroraView())
    }
}

