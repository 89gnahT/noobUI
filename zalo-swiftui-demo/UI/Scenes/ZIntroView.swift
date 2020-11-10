//
//  ZIntroView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/6/20.
//

import SwiftUI

struct ZIntroView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        let introView = UINavigationController(rootViewController: IntroViewController())
        introView.setNavigationBarHidden(true, animated: false)
        return introView
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        
    }
}
