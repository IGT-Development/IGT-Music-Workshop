//
//  Validation.swift
//  IGT Music Workshop
//
//  Created by Андрей Чередник on 27.01.2024.
//

import Foundation

struct ValidationHelper {
    static func isValidUsername(_ input: String) -> Bool {
        let usernameRegex = try! NSRegularExpression(pattern: "^[a-zA-Z]{3,}$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: input.utf16.count)
        let matches = usernameRegex.matches(in: input, options: [], range: range)
        return !matches.isEmpty
    }
    
    static func isValidPassword(_ input: String) -> Bool {
        let passwordRegex = try! NSRegularExpression(pattern: "^[A-Za-z0-9!@#$%^&*()-_+=<>?.,;:'\"`~\\/]{8,}$", options: .caseInsensitive)
        let range = NSRange(location: 0, length: input.utf16.count)
        let matches = passwordRegex.matches(in: input, options: [], range: range)
        return !matches.isEmpty
    }
    
    static func isValidInput(username: Bool, password: Bool) -> Bool {
        return username && password ? false : true
    }
}

