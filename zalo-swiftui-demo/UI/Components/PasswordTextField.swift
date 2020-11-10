//
//  PasswordTextField.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/4/20.
//

import UIKit
import SwiftUI

struct PasswordTextField: UIViewRepresentable {
    
    private let textField = WrappableTextField()
    
    var tag: Int = 0
    var placeholder: String?
    var onEditingChanged: ((String) -> Void)?
    var onCommit: (() -> Void)?
    
    func makeUIView(context: Context) -> WrappableTextField {
        self.textField.isSecureTextEntry = true
        self.textField.delegate = self.textField
        self.textField.autocorrectionType = .no
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = self.placeholder
        self.textField.onEditingChanged = onEditingChanged
        self.textField.onCommit = onCommit
        return self.textField
    }
    
    func updateUIView(_ uiView: WrappableTextField, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
//        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}
