//
//  IntroViewController.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 11/4/20.
//

import UIKit
import SwiftUI

class IntroViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let childView = UIHostingController(rootView: IntroView())
        let childView = ZAHostingController(rootView: IntroView())
        self.addChild(childView)
        childView.view.frame = self.view.frame
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
//        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: false)

    }
}
