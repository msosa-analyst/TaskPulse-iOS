//
//  StringValidations.swift
//  TaskPulse
//
//  Created by Manuel Alejandro Sosa Sanchez on 17/11/26.
//

import Foundation

extension String {
    
    func hasValidPerson() -> Bool {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmed.count > 2
    }
    
    func hasValidMinimumLength() -> Bool {
        return self.count >= 8 && !self.contains{ $0.isWhitespace}
    }
    
    func hasUpperCase() -> Bool {
        return self.contains { $0.isUppercase}
    }
    
    func hasLowerCase() -> Bool {
        return self.contains{ $0.isLowercase}
    }
    
    func hasNumber() -> Bool {
        return self.contains{ $0.isNumber}
    }
    

    
    func hasEmailValidate() -> Bool {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let regex = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
        return trimmed.wholeMatch(of: regex) != nil
    }
}
