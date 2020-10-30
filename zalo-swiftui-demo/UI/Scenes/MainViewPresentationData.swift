//
//  MainViewPresentationData.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import Foundation
import SwiftUI

class MainViewPresentationData: ObservableObject {
    
    @Published var selectedTab: Int = 0
    
    @Published var hideTabNavigation: Bool = false
    
    @Published var tabNavigationTitle: LocalizedStringKey = ""
    
    @Published var tabNavigationBarTrailingItems: AnyView = .init(EmptyView())
    
}
