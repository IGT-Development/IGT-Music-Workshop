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
    @State private var isRegistrationActive: Bool? = false
    @State private var loginAttempted: Bool? = false
    @State private var loginSuccessful: Bool? = false
    
    // Состояния для отображения ошибок
    @State private var isUsernameValid: Bool = true
    @State private var isPasswordValid: Bool = true
    
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
                        HStack(spacing: 16) {
                            Image(systemName: "person.fill")
                                .foregroundColor(.accentColor)
                            TextField("", text: $username, prompt: Text("Логин").foregroundColor(.white))
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                                .bold()
                                .disableAutocorrection(true)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(loginAttempted ?? false ? (isUsernameValid ? Color.white.opacity(0.3) : Color.red.opacity(0.3)) : Color.white.opacity(0.3))
                        )
                        .autocapitalization(.none)
                        .textContentType(.emailAddress)
                        .onChange(of: username) { newValue in
                            isUsernameValid = ValidationHelper.isValidUsername(newValue)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(loginAttempted ?? false ? (isUsernameValid ? Color.white : Color.red) : Color.white, lineWidth: 2)
                        )
                        HStack(spacing: 16) {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.accentColor)
                            SecureField("", text: $password, prompt: Text("Пароль").foregroundColor(.white))
                                .multilineTextAlignment(.leading)
                                .font(.title3)
                                .bold()
                                .disableAutocorrection(true)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(loginAttempted ?? false ? (isPasswordValid ? Color.white.opacity(0.3) : Color.red.opacity(0.3)) : Color.white.opacity(0.3))
                        )
                        .onChange(of: password) { newValue in
                            isPasswordValid = ValidationHelper.isValidPassword(newValue)
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(loginAttempted ?? false ? (isPasswordValid ? Color.white : Color.red) : Color.white, lineWidth: 2)
                        )
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
//    
//    private func isValidInput() -> Bool {
//        return isUsernameValid && isPasswordValid ? false : true
//    }
//    
//    private func validateUsername(_ input: String) {
//        let range = NSRange(location: 0, length: input.utf16.count)
//        let matches = usernameRegex.matches(in: input, options: [], range: range)
//        isUsernameValid = !matches.isEmpty
//    }
//    
//    private func validatePassword(_ input: String) {
//        let range = NSRange(location: 0, length: input.utf16.count)
//        let matches = passwordRegex.matches(in: input, options: [], range: range)
//        isPasswordValid = !matches.isEmpty
//    }
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

