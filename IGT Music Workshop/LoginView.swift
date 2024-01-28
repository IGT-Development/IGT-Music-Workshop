//
//  LoginView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 26.01.2024.
//

import SwiftUI
import Foundation

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isRegistrationActive: Bool? = false
    @State private var loginAttempted: Bool? = false
    @State private var loginSuccessful: Bool? = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Text("IGT \nMUSIC")
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.accentColor)
                    Spacer()
                    VStack (spacing: 16) {
                        Text("Вход")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        TextFields(textForPlaceholder: "Логин", iconName: "person.fill", loginAttempted: loginAttempted ?? false)
                        SecureFields(textForPlaceholder: "Пароль", image: "lock.fill", loginAttempted: loginAttempted ?? false)
                        Button(action: {
                            loginAttempted = true
                            loginSuccessful = ValidationHelper.isValidInput(username: isUsernameValid, password: isPasswordValid)
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
                                tag: true,
                                selection: $isRegistrationActive,
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
            .background(AuroraView(loginAttempted: $loginAttempted, loginSuccessful: $loginSuccessful))
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}




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

