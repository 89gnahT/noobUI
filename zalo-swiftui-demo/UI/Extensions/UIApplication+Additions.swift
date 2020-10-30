//
//  UIApplication+Additions.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/20/20.
//

import SwiftUI
import UIKit

extension UIApplication {
    class func setStatusBarStyle(_ style: UIStatusBarStyle) {
        if let vc = UIApplication.getKeyWindow()?.rootViewController as? ZAHostingController<IntroView> {
            vc.changeStatusBarStyle(style)
        }
    }
    
    private class func getKeyWindow() -> UIWindow? {
        return UIApplication.shared.windows.first{ $0.isKeyWindow }
    }
    
    func endEditing() {
        self.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
