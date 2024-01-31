//
//  TextFields.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 28.01.2024.
//

import Foundation
import SwiftUI

struct StartSecureFields: View {
    
    private var textForPlaceholder: String
    private var image: String
    private var loginAttempted: Bool
    private var secureContext: UITextContentType
    @Binding private var secureText: String
    @State private var isPasswordValid: Bool = false
    
    init(secureText: Binding<String>, textForPlaceholder: String, image: String, loginAttempted: Bool, secureContext: UITextContentType) {
            self.textForPlaceholder = textForPlaceholder
            self.image = image
            self.loginAttempted = loginAttempted
            self._secureText = secureText
            self.secureContext = secureContext
        }
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: image)
                .foregroundColor(.accentColor)
            SecureField("", text: $secureText, prompt: Text(textForPlaceholder).foregroundColor(.white))
                .multilineTextAlignment(.leading)
                .font(.title3)
                .bold()
                .textContentType(secureContext)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(loginAttempted ? (isPasswordValid ? Color.white.opacity(0.3) : Color.red.opacity(0.3)) : Color.white.opacity(0.3))
        )
        .onChange(of: secureText) { newValue in
            isPasswordValid = ValidationHelper.isValidPassword(newValue)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(loginAttempted ? (isPasswordValid ? Color.white : Color.red) : Color.white, lineWidth: 2)
        )
    }
}

struct StartTextFields: View {
    
    private var textForPlaceholder: String
    private var iconName: String
    private var loginAttempted: Bool
    private var secureContext: UITextContentType
    
    @Binding var fieldText: String
    @State private var isUsernameValid: Bool = false
    
    init(fieldText: Binding<String>, textForPlaceholder: String, iconName: String, loginAttempted: Bool, secureContext: UITextContentType) {
        self._fieldText = fieldText
        self.textForPlaceholder = textForPlaceholder
        self.iconName = iconName
        self.loginAttempted = loginAttempted
        self.secureContext = secureContext
    }
    
    var body: some View {
            HStack(spacing: 16) {
                Image(systemName: iconName)
                    .foregroundColor(.accentColor)
                TextField("", text: $fieldText, prompt: Text(textForPlaceholder).foregroundColor(.white))
                    .multilineTextAlignment(.leading)
                    .font(.title3)
                    .bold()
                    .disableAutocorrection(true)
                    .textContentType(secureContext)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(loginAttempted ? (isUsernameValid ? Color.white.opacity(0.3) : Color.red.opacity(0.3)) : Color.white.opacity(0.3))
            )
            .autocapitalization(.none)
            .textContentType(.emailAddress)
            .onChange(of: fieldText) { newValue in
                isUsernameValid = ValidationHelper.isValidUsername(newValue)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(loginAttempted ? (isUsernameValid ? Color.white : Color.red) : Color.white, lineWidth: 2)
            )
        }
}
