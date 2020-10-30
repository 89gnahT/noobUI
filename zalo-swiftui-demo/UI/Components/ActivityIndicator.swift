//
//  ActivityIndicator.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/29/20.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var animate: Bool

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}
