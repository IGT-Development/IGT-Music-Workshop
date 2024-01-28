//
//  TextFields.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 28.01.2024.
//

import Foundation
import SwiftUI

struct SecureFields: View {
    
    private var textForPlaceholder: String
    private var image: String
    private var loginAttempted: Bool
    @State private var password: String
    @State private var isPasswordValid: Bool = false
    
    init(textForPlaceholder: String, image: String, loginAttempted: Bool) {
        self.textForPlaceholder = textForPlaceholder
        self.image = image
        self.loginAttempted = loginAttempted
        self._password = State(initialValue: "")
    }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: image)
                .foregroundColor(.accentColor)
            SecureField("", text: $password, prompt: Text(textForPlaceholder).foregroundColor(.white))
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
    }
}

struct TextFields: View {
    
    private var textForPlaceholder: String
    private var iconName: String
    private var loginAttempted: Bool
    
    @State private var username: String
    @State private var isUsernameValid: Bool = false
    
    init(textForPlaceholder: String, iconName: String, loginAttempted: Bool) {
        self.textForPlaceholder = textForPlaceholder
        self.iconName = iconName
        self.loginAttempted = loginAttempted
        self._username = State(initialValue: "")
    }
    
    var body: some View {
            HStack(spacing: 16) {
                Image(systemName: iconName)
                    .foregroundColor(.accentColor)
                TextField("", text: $username, prompt: Text(textForPlaceholder).foregroundColor(.white))
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
        }
}
