//
//  WrappableTextField.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/4/20.
//

import UIKit
import Combine

class WrappableTextField: UITextField, UITextFieldDelegate {
    var onEditingChanged: ((String) -> Void)?
    var onCommit: (() -> Void)?
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let currentValue = textField.text as NSString? {
            let proposedValue = currentValue.replacingCharacters(in: range, with: string)
            onEditingChanged?(proposedValue as String)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommit?()
    }
}
