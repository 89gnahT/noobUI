//
//  RootNavigator.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/16/20.
//

import Foundation
import Combine

enum AuthState {
    case loggedOut
    case loggedIn
}

class RootNavigator: NSObject, ObservableObject {

    @Published var currentState: AuthState = .loggedOut
    @Published var queryParams: [AnyHashable: Any]? = nil

    public static let shared = RootNavigator()
    
    let authEventPublisher = CurrentValueSubject<AuthEvent?, Never>(nil)
}

extension RootNavigator: AuthManagerDelegate {
    func appManager(_ manager: AuthManager?, sessionDidLogin dictionary: [AnyHashable : Any]?) {
        self.authEventPublisher.send(.sessionDidLogin)
    }
    
    func appManager(_ manager: AuthManager?, sessionDidLogout dictionary: [AnyHashable : Any]?) {
        self.authEventPublisher.send(.sessionDidLogout)
    }
    
    
}
