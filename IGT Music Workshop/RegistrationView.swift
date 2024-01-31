//
//  RegistrationView.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 29.01.2024.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isRegistrationActive: Bool? = false
    @State private var loginAttempted: Bool = false
    @State private var loginSuccessful: Bool = true
    
    var body: some View {
        ZStack{
            VStack (spacing: 16) {
                Capsule()
                    .frame(width: 50, height: 10)
                    .foregroundColor(Color.white.opacity(0.3))
                    .padding(.bottom)
                Spacer()
                Text("Регистрация")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                StartTextFields(fieldText: $email, textForPlaceholder: "Почта", iconName: "person.fill", loginAttempted: loginAttempted, secureContext: .emailAddress)
                StartTextFields(fieldText: $username, textForPlaceholder: "Логин", iconName: "person.fill", loginAttempted: loginAttempted, secureContext: .username)
                StartSecureFields(secureText: $password, textForPlaceholder: "Пароль", image: "lock.fill", loginAttempted: loginAttempted, secureContext: .newPassword)
                StartSecureFields(secureText: $repeatPassword, textForPlaceholder: "Пароль", image: "lock.fill", loginAttempted: loginAttempted, secureContext: .newPassword)
                Button(action: {
                    isUsernameValid = ValidationHelper.isValidUsername(username)
                    isPasswordValid = ValidationHelper.isValidPassword(password)
                    loginAttempted = true
                    loginSuccessful = ValidationHelper.isValidInput(username: isUsernameValid, password: isPasswordValid)
                    print(loginSuccessful)
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
        .background(AuroraView(loginAttempted: loginAttempted, loginSuccessful: loginSuccessful))
    }
}
