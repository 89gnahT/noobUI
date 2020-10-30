//
//  CGFloat+Additions.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/20/20.
//

import UIKit

extension CGFloat {
    
    static var adaptiveButtonWidth: CGFloat {
        return Swift.min(UIScreen.main.bounds.size.width * 0.6, 414)
    }
    
    static var adaptiveContentWidth: CGFloat {
        return Swift.min(UIScreen.main.bounds.size.width, 414)
    }
}
