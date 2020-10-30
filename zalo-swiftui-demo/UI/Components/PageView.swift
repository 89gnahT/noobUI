//
//  PageView.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage = 0
    init(_ views: [Page]) {
        self.viewControllers = views.map {
            let vc = UIHostingController(rootView: $0)
            vc.view.backgroundColor = .clear
            return vc
        }
    }
    
    var body: some View {
        VStack {
            PageViewController(controllers: self.viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: self.viewControllers.count, currentPage: $currentPage)
            
        }
    }
}

