//
//  AuthCodeTextField.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/09/16.
//

import SwiftUI

struct AuthCodeTextField: View {
    @Binding var authCode: String
    
    init(authCode: Binding<String>) {
        self._authCode = authCode
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            ForEach(0..<4, id: \.self) { index in
                let currentIndex = authCode.index(authCode.startIndex, offsetBy: index)
                let digit = authCode[currentIndex]
                DigitTextField(digit: Binding<String>(
                    get: { String(digit) },
                    set: { newValue in
                        if newValue.count == 1 {
                            authCode.replaceSubrange(currentIndex...currentIndex, with: newValue)
                            if index < 3 {
                                focusTextField(index + 1)
                            }
                        }
                    }
                ))
                .frame(width: 70, height: 70)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            }
        }
    }
    
    private func focusTextField(_ index: Int) {
        // You can implement focus handling here
        // For example, you can use UIResponder to make a UITextField first responder
        // or use other SwiftUI methods to manage focus
    }
}

struct DigitTextField: View {
    @Binding var digit: String
    
    var body: some View {
        TextField("", text: $digit)
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .font(.system(size: 20))
    }
}
