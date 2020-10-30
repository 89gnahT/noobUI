//
//  View+Additions.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/23/20.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
