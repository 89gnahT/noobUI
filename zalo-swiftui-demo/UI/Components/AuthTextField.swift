//
//  AuthTextField.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/22/20.
//

import SwiftUI

enum AuthTextFieldType {
    case simple
    case secure
    case countryAndPhone
}

struct SimpleAuthTextField: View {
    
    private var placeHolder: String = ""
    @Binding var text: String
    @State private var isEditing: Bool = false
    
    init(placeHolder: String = "Please Input",
         text: Binding<String> = .constant("")) {
        self._text = text
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        TextField(self.placeHolder, text: self.$text, onEditingChanged: { isEditing in
            self.isEditing = isEditing
        })
        .overlay(
            Divider()	
                .frame(height: self.isEditing ? 2 : 1)
                .background(self.isEditing ? Color.bl300 : Color.lg300)
                .offset(x: 0, y: 20))
    }
    
}

struct SecureAuthTextField: View {
    private var placeHolder: String = ""
    @Binding var text: String
    @State private var isEditing: Bool = false
    
    init(placeHolder: String = "Please Input",
         text: Binding<String> = .constant("")) {
        self._text = text
        self.placeHolder = placeHolder
    }
    
    var body: some View {
        SecureField(self.placeHolder, text: self.$text)
            .onTapGesture {
                self.isEditing = true
            }
            .overlay(
                Divider()
                    .frame(height: self.isEditing ? 2 : 1)
                    .background(self.isEditing ? Color.bl300 : Color.lg300)
                    .offset(x: 0, y: 20))
        Divider()
            .frame(height: self.isEditing ? 2 : 1)
            .background(self.isEditing ? Color.bl300 : Color.lg300)
    }
}

struct AuthTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SimpleAuthTextField()
            
            SecureAuthTextField()
        }
    }
}
