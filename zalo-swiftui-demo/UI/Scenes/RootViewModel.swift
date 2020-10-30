//
//  RootViewModel.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/15/20.
//

import Foundation

//enum AuthState {
//    case loggedOut
//    case loggedIn
//}

class RootViewModel: ObservableObject {
    
    @Published var authState: AuthState = .loggedOut {
        didSet {
            print("Authentication state: \(self.authState)")
        }
    }
    
    
    
}
