//
//  UIViewController+Additions.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/3/20.
//

import UIKit

extension UIViewController: SplitViewControllerProtocol {
    
    @objc open func inDetail() -> Bool {
        return false
    }
    
}
